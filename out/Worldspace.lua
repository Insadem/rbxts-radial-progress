local Util = require(script.Parent.Util)

local ProgressWorldspace = {}

function CreateDot(self)
	local Dot = Instance.new("Part")
	Dot.Name = "Dot"
	Dot.Shape = "Cylinder"
	Dot.Color = Color3.new(1, 1, 1)
	Dot.Material = Enum.Material.SmoothPlastic
	Dot.CastShadow = false
	Dot.CanCollide = false
	Dot.CanTouch = false
	Dot.CanQuery = false
	Dot.Anchored = true
	Dot.Rotation = Vector3.new(0, 0, 90)
	Dot.Parent = self.Instance
	return Dot
end

function PositionDot(self, Dot: Part, Progress: number, In: boolean)
	local NearestPart = math.ceil(#self._PartArray*Progress/100)-1
	local Part = self._PartArray[NearestPart]
	
	if NearestPart <= 0 then
		if #self._PartArray > 0 then
			Part = self._PartArray[1]
			In = true
		else
			return
		end
	end
	
	local Translation = Part.Size.Z/2
	if In then Translation = -Translation end
	
	local DotCFrame = CFrame.new(Vector3.new(0, 0, Translation)) * CFrame.Angles(0, 0, math.rad(90))
	
	Dot.CFrame = Part.CFrame:ToWorldSpace(DotCFrame)
end

function Position(self, Part: Part, Rotation: number)
	local MathRotation = math.rad(Rotation)

	local CircleX = math.cos(MathRotation) * self.Radius
	local CircleY = math.sin(MathRotation) * self.Radius
	
	local Range1 = {0, 360}
	local Range2 = {0, -360}
	
	local CircleRotation = Util.ShiftRange(Range1, Range2, Rotation)
	local CircleCFrame = CFrame.new(Vector3.new(CircleX,0,CircleY) + self.Position) * CFrame.Angles(0, math.rad(CircleRotation), 0)
	
	Part.CFrame = CFrame.Angles(math.rad(self.Rotation.X), math.rad(self.Rotation.Y), math.rad(self.Rotation.Z)):ToWorldSpace(CircleCFrame)
end

function UpdateFill(self)
	local Percent = self.Progress/100 
	local EffectedParts = math.ceil(#self._PartArray*Percent)
	local Difference = #self._PartArray-EffectedParts
	
	
	for i, v in pairs(self._PartArray) do
		if i >= EffectedParts then
			v.Transparency = 1
			v:SetAttribute("Disabled", true)
		elseif v:GetAttribute("Disabled") then
			v:SetAttribute("Disabled", false)
			v.Transparency = self.Transparency
		end 
	end
	PositionDot(self, self._Dot, self.Progress)
end

function UpdateCircle(self)
	local OuterJoin = self.Thickness*math.tan(math.rad(self._Deg))
	self._Length = (self.Radius*math.tan(math.rad(self._Deg/2)))*2 + OuterJoin/2
	
	local Size = Vector3.new(1, self.Thickness, self.Thickness)
	self._Dot.Size = Size
	self._CenterDot.Size = Size
	
	for i, v in pairs(self._PartArray) do
		v.Size = Vector3.new(self.Thickness, 1, self._Length)
		Position(self, v, self._Deg*i)
	end
	
	PositionDot(self, self._CenterDot, 0, true)
	PositionDot(self, self._Dot, self.Progress)

end

function UpdateAccuracy(self)
	local Parts = math.ceil(self.Accuracy * 20)
	self._Deg = 360/Parts
	if self._PartArray == Parts then return end
	
	local Difference = math.abs(#self._PartArray - Parts)
	
	if #self._PartArray < Parts then
		for i = 0, Difference do
			local Part = Instance.new("Part")
			Part.Color = Color3.new(1, 1, 1)
			Part.Material = Enum.Material.SmoothPlastic
			Part.CastShadow = false
			Part.CanCollide = false
			Part.CanTouch = false
			Part.CanQuery = false
			Part.Anchored = true
			Part.Parent = self.Instance
			table.insert(self._PartArray, Part)
		end
	elseif #self._PartArray > Parts then
		for i = #self._PartArray, Parts, -1 do
			self._PartArray[i]:Destroy()
			table.remove(self._PartArray, i)
			if #self._PartArray == Parts+1 then break end
		end
	end
	UpdateCircle(self)
	UpdateFill(self)
end

local Update = {
	Progress = function(self) UpdateFill(self) end;
	
	Rotation = function(self) UpdateCircle(self) end;
	Position = function(self) UpdateCircle(self) end;
	Thickness = function(self) UpdateCircle(self) end;
	Radius = function(self) UpdateCircle(self) end;
	Accuracy = function(self) UpdateAccuracy(self) end;
	
	Color = function(self)
		for i, v in pairs(self._PartArray) do v.Color = self.Color end
		self._Dot.Transparency = self.Color
		self._CenterDot.Transparency = self.Color
	end;
	Transparency = function(self)
		for i, v in pairs(self._PartArray) do
			if not v:GetAttribute("Disabled") then v.Transparency = self.Transparency end
			if not self._Dot:GetAttribute("Disabled") then
				self._Dot.Transparency = self.Transparency
				self._CenterDot.Transparency = self.Transparency
			end
		end
	end;
	
	Rounded = function(self)
		self._Dot:SetAttribute("Disabled", not self.Rounded)
		local Transparency = self.Transparency
		if not self.Rounded then Transparency = 1 end
		self._Dot.Transparency = Transparency
		self._CenterDot.Transparency = Transparency
	end;
	
	Parent = function(self)
		if self.Parent == nil and self._InitializeParent == true then
			self.Parent = workspace
			self._Folder = false
		end
		self.Instance.Parent = self.Parent
	end
}

function ProgressWorldspace.new(Properties: Util.propertyTable)
	local ProgressCircle = {}

	ProgressCircle.Progress = 0 -- from 0 to 100 -|interchangable
	ProgressCircle.Rotation = Vector3.new(0, 0, 0)
	ProgressCircle.Position = Vector3.new(0, 0, 0)
	ProgressCircle.Accuracy = 3 --from 2 to 10
	ProgressCircle.Thickness = 4 --from 2 to 12
	ProgressCircle.Radius = 10 -- from 0 to 10
	
	ProgressCircle.Color = Color3.fromRGB(255, 255, 255)
	ProgressCircle.Transparency = 0

	ProgressCircle.Rounded = true
	
	ProgressCircle.Parent = nil

	if Properties then
		for i, v in pairs(Properties) do ProgressCircle[i] = v end
	end
	
	ProgressCircle._PartArray = {}
	ProgressCircle._DisabledParts = {}
	ProgressCircle._Deg = 0
	ProgressCircle._Length = 0
	
	ProgressCircle._InitializeParent = true
	ProgressCircle.Instance = Instance.new("Folder")
	ProgressCircle.Instance.Name = "ProgressCircle"
	
	ProgressCircle._Dot = CreateDot(ProgressCircle)
	ProgressCircle._CenterDot = CreateDot(ProgressCircle)

	for i, v in pairs(Update) do
		v(ProgressCircle)
	end

	local Metatable = setmetatable({}, { 
		__index = function(T, Key, Value)
			if ProgressCircle[Key] ~= nil then
				return ProgressCircle[Key]
			end
			if ProgressWorldspace[Key] ~= nil then
				return ProgressWorldspace[Key]
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

function ProgressWorldspace:Tween(TweenInfo, Properties: Util.propertyTable)
	self._TweenService:Tween(TweenInfo, Properties) -- Use util module
end

function ProgressWorldspace:Destroy() --Disconnect all connections related to the progress bar
	self.Instance:Destroy()
	self._TweenService:Destroy()

	setmetatable(self, nil)
end

return ProgressWorldspace