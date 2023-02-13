local Util = require(script.Parent.Util)
local Worldspace = require(script.Parent.Worldspace)

local ProgressViewport = {}

local function CreateViewport()
	local ViewportFrame = Instance.new("ViewportFrame")
	ViewportFrame.Ambient = Color3.new(1, 1, 1)
	ViewportFrame.LightColor = Color3.new(1, 1, 1)
	ViewportFrame.LightDirection = Vector3.new(0, 2, 0)
	ViewportFrame.BackgroundTransparency = 1
	ViewportFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	
	local Camera = Instance.new("Camera")
	Camera.FieldOfView = 5
	Camera.CFrame = CFrame.new(0,400,0) * CFrame.fromOrientation(math.rad(-90), math.rad(-90), 0)
	Camera.Parent = ViewportFrame
	ViewportFrame.CurrentCamera = Camera
	
	return ViewportFrame
end

local Update = {
	Size = function(self) self.Instance.Size = self.Size end;
	Position = function(self) self.Instance.Position = self.Position end;
	Zoom = function(self) self.Instance.CurrentCamera.FieldOfView = self.Zoom end;
	
	Color = function(self) self.Instance.ImageColor3 = self.Color end;
	Transparency = function(self) self.Instance.ImageTransparency = self.Transparency end;
	
	Parent = function(self)
		if self.Parent == nil and self._InitializeParent == true then
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

function ProgressViewport.new(Properties: Util.propertyTable)	
	local ProgressCircle = {}
	ProgressCircle._WorldspaceCircle = Worldspace.new() -- Initialize as worldspace
	
	ProgressCircle.Size = UDim2.fromScale(0.4, 0.4)
	ProgressCircle.Position = UDim2.fromScale(0, 0)
	ProgressCircle.Zoom = 5
	
	ProgressCircle.Color = Color3.fromRGB(255, 255, 255)
	ProgressCircle.Transparency = 0
	
	ProgressCircle.Parent = nil
	
	if Properties then
		for i, v in pairs(Properties) do ProgressCircle[i] = v end
	end
	
	ProgressCircle._ScreenGui = true
	ProgressCircle._WorldspaceCircle.Parent = CreateViewport(ProgressCircle)
	ProgressCircle.Instance = ProgressCircle._WorldspaceCircle.Parent
	
	local Metatable = setmetatable({}, { 
		__index = function(T, Key, Value)
			if ProgressCircle[Key] ~= nil then
				return ProgressCircle[Key]
			end
			if ProgressViewport[Key] ~= nil then
				return ProgressViewport[Key]
			end
			if ProgressCircle._WorldspaceCircle[Key] ~= nil then --Only default to Worldspace when others aren't viable
				return ProgressCircle._WorldspaceCircle[Key]
			end
		end,
		__newindex = function(T, Property, Value)
			if ProgressCircle[Property] == Value then return end
			if Update[Property] then
				ProgressCircle[Property] = Value
				Update[Property](ProgressCircle)
				return
			end
			if ProgressCircle._WorldspaceCircle[Property] ~= nil then -- Default to Update methods from worldspace when others aren't viable
				ProgressCircle[Property] = Value
				ProgressCircle._WorldspaceCircle[Property] = Value
			end
		end
	})
	
	for i, v in pairs(ProgressCircle) do -- Re-add properties to trigger index metatable.
		Metatable[i] = v;
	end

	-- for i, v in pairs(Update) do
	-- 	v(ProgressCircle)
	-- end

	return Metatable
end

function ProgressViewport.fromWorldspace(Properties: Util.propertyTable)
	return Worldspace.new(Properties)
end

function ProgressViewport:Tween(TweenInfo, Properties: Util.propertyTable)
	self._TweenService:Tween(TweenInfo, Properties) -- Use util module
end

function ProgressViewport:Destroy() --Disconnect all connections related to the progress bar
	self.Instance:Destroy()
	self._WorldspaceCircle:Destroy()

	setmetatable(self, nil)
end

return ProgressViewport
