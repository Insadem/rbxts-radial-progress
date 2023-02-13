-- Generated using RoadToGlory's Converter v1.1 (RoadToGlory#9879)

-- Instances:

local Converted = {
	["_ProgressCircle"] = Instance.new("Frame");
	["_BG"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_Circle"] = Instance.new("CanvasGroup");
	["_LeftClip"] = Instance.new("Frame");
	["_Circle1"] = Instance.new("Frame");
	["_UICorner1"] = Instance.new("UICorner");
	["_UIGradient"] = Instance.new("UIGradient");
	["_HideCircle"] = Instance.new("Frame");
	["_UICorner2"] = Instance.new("UICorner");
	["_UIGradient1"] = Instance.new("UIGradient");
	["_RightClip"] = Instance.new("Frame");
	["_Circle2"] = Instance.new("Frame");
	["_UICorner3"] = Instance.new("UICorner");
	["_UIGradient2"] = Instance.new("UIGradient");
	["_HideCircle1"] = Instance.new("Frame");
	["_UICorner4"] = Instance.new("UICorner");
	["_UIGradient3"] = Instance.new("UIGradient");
	["_CenterDot"] = Instance.new("Frame");
	["_UICorner5"] = Instance.new("UICorner");
	["_HideCircle2"] = Instance.new("Frame");
	["_UICorner6"] = Instance.new("UICorner");
	["_UIPadding"] = Instance.new("UIPadding");
}

-- Properties:

Converted["_ProgressCircle"].AnchorPoint = Vector2.new(0, 1)
Converted["_ProgressCircle"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
Converted["_ProgressCircle"].BackgroundTransparency = 1
Converted["_ProgressCircle"].Position = UDim2.new(0.0399999991, 0, 0.949999988, 0)
Converted["_ProgressCircle"].Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
Converted["_ProgressCircle"].SizeConstraint = Enum.SizeConstraint.RelativeYY
Converted["_ProgressCircle"].Name = "ProgressCircle"

Converted["_BG"].BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
Converted["_BG"].BorderSizePixel = 0
Converted["_BG"].Size = UDim2.new(1, 0, 1, 0)
Converted["_BG"].SizeConstraint = Enum.SizeConstraint.RelativeYY
Converted["_BG"].ZIndex = 7
Converted["_BG"].Name = "BG"
Converted["_BG"].Parent = Converted["_ProgressCircle"]

Converted["_UICorner"].CornerRadius = UDim.new(0.200000003, 0)
Converted["_UICorner"].Parent = Converted["_BG"]

Converted["_Circle"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Circle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Circle"].BackgroundTransparency = 1
Converted["_Circle"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Circle"].Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
Converted["_Circle"].SizeConstraint = Enum.SizeConstraint.RelativeXX
Converted["_Circle"].ZIndex = 8
Converted["_Circle"].Name = "Circle"
Converted["_Circle"].Parent = Converted["_ProgressCircle"]

Converted["_LeftClip"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_LeftClip"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_LeftClip"].BackgroundTransparency = 1
Converted["_LeftClip"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_LeftClip"].Size = UDim2.new(0.5, 0, 1, 4)
Converted["_LeftClip"].ZIndex = 10
Converted["_LeftClip"].Name = "LeftClip"
Converted["_LeftClip"].Parent = Converted["_Circle"]

Converted["_Circle1"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_Circle1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Circle1"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_Circle1"].Size = UDim2.new(2, 0, 1, -4)
Converted["_Circle1"].ZIndex = 10
Converted["_Circle1"].Name = "Circle"
Converted["_Circle1"].Parent = Converted["_LeftClip"]

Converted["_UICorner1"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner1"].Parent = Converted["_Circle1"]

Converted["_UIGradient"].Offset = Vector2.new(0.009999999776482582, 0)
Converted["_UIGradient"].Rotation = 10
Converted["_UIGradient"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.49900001287460327, 1),
	NumberSequenceKeypoint.new(0.5009999871253967, 0),
	NumberSequenceKeypoint.new(1, 0)
}
Converted["_UIGradient"].Parent = Converted["_Circle1"]

Converted["_HideCircle"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_HideCircle"].BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
Converted["_HideCircle"].Position = UDim2.new(0, 1, 0.5, 0)
Converted["_HideCircle"].Size = UDim2.new(2, 0, 1, 0)
Converted["_HideCircle"].ZIndex = 12
Converted["_HideCircle"].Name = "HideCircle"
Converted["_HideCircle"].Parent = Converted["_LeftClip"]

Converted["_UICorner2"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner2"].Parent = Converted["_HideCircle"]

Converted["_UIGradient1"].Rotation = 180
Converted["_UIGradient1"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(0.5009999871253967, 1),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_UIGradient1"].Parent = Converted["_HideCircle"]

Converted["_RightClip"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_RightClip"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_RightClip"].BackgroundTransparency = 1
Converted["_RightClip"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_RightClip"].Size = UDim2.new(0.5, 0, 1, 4)
Converted["_RightClip"].ZIndex = 10
Converted["_RightClip"].Name = "RightClip"
Converted["_RightClip"].Parent = Converted["_Circle"]

Converted["_Circle2"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_Circle2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Circle2"].Position = UDim2.new(-1, 0, 0.5, 0)
Converted["_Circle2"].Size = UDim2.new(2, 0, 1, -4)
Converted["_Circle2"].ZIndex = 13
Converted["_Circle2"].Name = "Circle"
Converted["_Circle2"].Parent = Converted["_RightClip"]

Converted["_UICorner3"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner3"].Parent = Converted["_Circle2"]

Converted["_UIGradient2"].Offset = Vector2.new(-0.009999999776482582, 0)
Converted["_UIGradient2"].Rotation = 180
Converted["_UIGradient2"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(0.5009999871253967, 1),
	NumberSequenceKeypoint.new(1, 1)
}
Converted["_UIGradient2"].Parent = Converted["_Circle2"]

Converted["_HideCircle1"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_HideCircle1"].BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
Converted["_HideCircle1"].Position = UDim2.new(-1, -1, 0.5, 0)
Converted["_HideCircle1"].Size = UDim2.new(2, 4, 1, 6)
Converted["_HideCircle1"].ZIndex = 14
Converted["_HideCircle1"].Name = "HideCircle"
Converted["_HideCircle1"].Parent = Converted["_RightClip"]

Converted["_UICorner4"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner4"].Parent = Converted["_HideCircle1"]

Converted["_UIGradient3"].Rotation = 180
Converted["_UIGradient3"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.5, 1),
	NumberSequenceKeypoint.new(0.5009999871253967, 0),
	NumberSequenceKeypoint.new(1, 0)
}
Converted["_UIGradient3"].Parent = Converted["_HideCircle1"]

Converted["_CenterDot"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_CenterDot"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_CenterDot"].Position = UDim2.new(0.5, 0, 0, 0)
Converted["_CenterDot"].Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
Converted["_CenterDot"].ZIndex = 20
Converted["_CenterDot"].Name = "CenterDot"
Converted["_CenterDot"].Parent = Converted["_Circle"]

Converted["_UICorner5"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner5"].Parent = Converted["_CenterDot"]

Converted["_HideCircle2"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_HideCircle2"].BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
Converted["_HideCircle2"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_HideCircle2"].Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
Converted["_HideCircle2"].SizeConstraint = Enum.SizeConstraint.RelativeYY
Converted["_HideCircle2"].ZIndex = 20
Converted["_HideCircle2"].Name = "HideCircle"
Converted["_HideCircle2"].Parent = Converted["_Circle"]

Converted["_UICorner6"].CornerRadius = UDim.new(1, 0)
Converted["_UICorner6"].Parent = Converted["_HideCircle2"]

Converted["_UIPadding"].PaddingBottom = UDim.new(0, 1)
Converted["_UIPadding"].PaddingLeft = UDim.new(0, 1)
Converted["_UIPadding"].PaddingRight = UDim.new(0, 1)
Converted["_UIPadding"].PaddingTop = UDim.new(0, 1)
Converted["_UIPadding"].Parent = Converted["_Circle"]

return Converted["_ProgressCircle"];