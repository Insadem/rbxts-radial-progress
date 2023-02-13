local Util = require(script.Util);
local Viewport = require(script.Viewport);
local ProgressCircleUI = require(script.ProgressCircleUI);
local PresetAnimations = require(script.PresetAnimations);

local CircularProgress = {}

local function GetDots(self, Function)
	for i, v in pairs(self.Instance.Circle:GetChildren()) do
		if v.Name == "Dot" or v.Name == "CenterDot" then
			Function(v)
		end
	end
end

local function UpdateFill(self, UsePercent)
	local Circle = self.Instance.Circle
	local QuarterCircle = Circle

	local Rotation = self.Rotation
	if UsePercent then
		Rotation = self.Progress * 3.6
	end
	Rotation = math.fmod(Rotation, 360.1)

	--Set fill
	local Right = Circle.RightClip.Circle.UIGradient
	local Left = Circle.LeftClip.Circle.UIGradient
	if Rotation < 180 and Rotation > -180 then
		Circle.RightClip.HideCircle.Visible = true
		Right.Rotation = Rotation
		Left.Rotation = 0
	else
		Circle.RightClip.HideCircle.Visible = false
		Right.Rotation = 180
		Left.Rotation = Rotation - 180
	end

	--Check if the fill should be rounded
	if self.Rounded == true then
		--Create dot
		local Dot = QuarterCircle:FindFirstChild("Dot")
		if not Dot then
			Dot = QuarterCircle.CenterDot:Clone()
			Dot.Name = "Dot"
			Dot.Parent = QuarterCircle
		end

		--Set dot pos
		local MathRotation
		if Rotation <= 90 then MathRotation = (360-90) + Rotation else MathRotation = Rotation - 90 end
		MathRotation = math.rad(MathRotation)
		
		local Range1 = {-1, 1}
		local Range2 = {0, 1}

		local X = Util.ShiftRange(Range1, Range2, math.cos(MathRotation))
		local Y = Util.ShiftRange(Range1, Range2, math.sin(MathRotation))

		Dot.AnchorPoint = Vector2.new(X, Y)	
		Dot.Position = UDim2.fromScale(X, Y)

		self.Progress = Rotation / 3.6
		self.Rotation = Rotation
	end
end

--All the functions for updating properties

local Update = {
	Progress = function(self) UpdateFill(self, true) end;
	Rotation = function(self) UpdateFill(self) end;
	
	Position = function(self) self.Instance.Position = self.Position end;
	AnchorPoint = function(self) self.Instance.AnchorPoint = self.AnchorPoint end;
	Size = function(self) self.Instance.Size = UDim2.fromScale(self.Size, self.Size) end;
	Thickness = function(self)
		local Thickness = 1 - self.Thickness

		self.Instance.Circle.HideCircle.Visible = true
		if self.Thickness == 1 then self.Instance.Circle.HideCircle.Visible = false end

		self.Instance.Circle.HideCircle.Size = UDim2.fromScale(Thickness, Thickness)
		for i, v in pairs(self.Instance.Circle:GetChildren()) do
			if v.Name == "Dot" or v.Name == "CenterDot" then
				v.Size = UDim2.fromScale(self.Thickness/2, self.Thickness/2)
			end
		end
	end;
	CircleSize = function(self) self.Instance.Circle.Size = UDim2.fromScale(self.CircleSize, self.CircleSize) end;

	Color = function(self) 
		self.Instance.Circle.LeftClip.Circle.BackgroundColor3 = self.Color
		self.Instance.Circle.RightClip.Circle.BackgroundColor3 = self.Color
		GetDots(self, function(v) v.BackgroundColor3 = self.Color end)
	end;
	BGColor = function(self)
		self.Instance.BG.BackgroundColor3 = self.BGColor
		for i, v in pairs(self.Instance.Circle:GetDescendants()) do
			if v.Name == "HideCircle" then v.BackgroundColor3 = self.BGColor end
		end
	end;
	Transparency = function(self)
		self.Instance.Circle.GroupTransparency = self.Transparency
	end,
	BGRoundness = function(self) self.Instance.BG.UICorner.CornerRadius = UDim.new(self.BGRoundness) end;

	Rounded = function(self)
		GetDots(self, function(v) v.Visible = self.Rounded end)
	end;

	Parent = function(self) 
		if self.Parent == nil and self._InitializeParent == true then --Automatically create GUI if parent not initialized
			self._ScreenGui = Instance.new("ScreenGui")
			self._ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
			self._ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			self._ScreenGui.Name = "CircularProgress"
			self.Instance.Parent = self._ScreenGui
			self.Parent = self._ScreenGui
			self._InitializeParent = false
		else
			if self.Instance.Parent == self._ScreenGui then self.Instance.Parent = nil self._ScreenGui:Destroy() end --Destroy automatically created GUI
			self.Instance.Parent = self.Parent
		end
	end
}

function CircularProgress.new(Properties: Util.propertyTable)
	local ProgressCircle = {}

	ProgressCircle.Progress = 0 -- from 0 to 100 -|interchangable
	ProgressCircle.Rotation = 0 -- from 0 to 360 -|interchangable

	ProgressCircle.Position = UDim2.fromScale(0.04, 0.95)
	ProgressCircle.AnchorPoint = Vector2.new(0, 0)
	ProgressCircle.Size = 0.2 -- from 0 to 1
	ProgressCircle.Thickness = 0.3 -- from 0 to 1
	ProgressCircle.CircleSize = 0.7 -- from 0 to 1

	ProgressCircle.Color = Color3.fromRGB(255, 255, 255)
	ProgressCircle.BGColor = Color3.fromRGB(30, 30, 30)
	ProgressCircle.Transparency = 0 --from 0 to 1
	ProgressCircle.BGRoundness = 0.2 -- from 0 to 1

	ProgressCircle.Rounded = true

	local Object = ProgressCircleUI:Clone()
	ProgressCircle._InitializeParent = true
	ProgressCircle.Parent = nil

	if Properties then
		for i, v in pairs(Properties) do ProgressCircle[i] = v end
	end
	
	ProgressCircle.Instance = Object

	for i, v in pairs(Update) do
		v(ProgressCircle)
	end
	
	local Metatable = setmetatable({}, { 
		__index = function(T, Key, Value)
			if ProgressCircle[Key] ~= nil then
				return ProgressCircle[Key]
			end
			if CircularProgress[Key] ~= nil then
				return CircularProgress[Key]
			end
		end,
		__newindex = function(T, Property, Value)
			if Update[Property] and ProgressCircle[Property] ~= Value then
				ProgressCircle[Property] = Value
				Update[Property](ProgressCircle)
			end
		end
	})
	ProgressCircle._TweenService = Util.TweenService.new(Metatable)
	
	return Metatable
end

function CircularProgress.fromViewport(Properties: Util.propertyTable)
	return Viewport.new(Properties)
end

function CircularProgress.fromWorldspace(Properties: Util.propertyTable)
	return Viewport.fromWorldspace(Properties)
end

function CircularProgress:Tween(TweenInfo: TweenInfo, Properties: Util.propertyTable)
	self._TweenService:Tween(TweenInfo, Properties) -- Use util module
end

function CircularProgress:Animate(Animation)
	local Loop = PresetAnimations[Animation](self)
	
	if Loop then self._TweenService:Add(Loop) end
end

function CircularProgress:Destroy() --Disconnect all connections related to the progress bar
	self.Instance:Destroy()
	self._TweenService:Destroy()
	
	setmetatable(self, nil)
end

-- Export this
CircularProgress.PresetAnimations = { -- Map<string, function(this)> - this is CircularProgress class instance
	InfSpin1 = PresetAnimations.InfSpin1,
	InfSpin2 = PresetAnimations.InfSpin2,
	InfSpin3 = PresetAnimations.InfSpin3
}

return CircularProgress
