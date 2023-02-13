-- Compiled with roblox-ts v2.0.4
local TS = _G[script]
local CircularProgress = TS.import(script, script.Parent.Parent)
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
-- New progress circle
local LoadCircle1 = CircularProgress.new()
LoadCircle1.AnchorPoint = Vector2.new(0, 1)
LoadCircle1:Animate("InfSpin1")
-- New progress circle, customize the properties in the function like this > Circle.new({Thickness = 0.3})
local LoadCircle2 = CircularProgress.new({
	Position = UDim2.fromScale(0.04, 0.65),
	Color = Color3.fromRGB(255, 69, 72),
	AnchorPoint = Vector2.new(0, 1),
	BGRoundness = 1,
	Thickness = 0.5,
})
LoadCircle2:Animate("InfSpin2")
-- New progress circle
local LoadCircle3 = CircularProgress.new({
	BGColor = Color3.fromRGB(23, 27, 85),
	Position = UDim2.fromScale(0.04, 0.65),
})
LoadCircle3.Color = Color3.new(1, 1, 1)
LoadCircle3.BGRoundness = 0.1
LoadCircle3.AnchorPoint = Vector2.new(0.5, 0.5)
LoadCircle3.Thickness = 0.5
LoadCircle3.CircleSize = 0.8
LoadCircle3.Transparency = 0.7
LoadCircle3:Animate("InfSpin3")
task.wait(1)
local TweenInf = TweenInfo.new(3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
LoadCircle3:Tween(TweenInf, {
	Color = Color3.fromRGB(89, 164, 255),
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.65, 0.85),
	Transparency = 0,
})
CircularProgress.PresetAnimations.Test = function(instance)
	task.spawn(function()
		while true do
			local _value = task.wait(1)
			if not (_value ~= 0 and (_value == _value and _value)) then
				break
			end
			local _fn = instance
			local _exp = TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
			local _object = {}
			local _left = "Rotation"
			instance.Rotation -= 90
			_object[_left] = instance.Rotation
			_fn:Tween(_exp, _object)
		end
	end)
end
print(CircularProgress.PresetAnimations)
local LoadCircle4 = CircularProgress.new()
LoadCircle4:Animate("Test")
LoadCircle4.BGColor = Color3.fromRGB(5, 227, 97)
LoadCircle4.Position = UDim2.fromScale(0.75, 0.25)
