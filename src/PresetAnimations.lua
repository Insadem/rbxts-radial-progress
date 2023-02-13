local TweenService = game:GetService("TweenService")

local Animations = {}

--Infinite loading animations
function Animations.InfSpin1(self)
	local Circle = self.Instance.Circle
	self.Rotation = 320
	local TweenInf = TweenInfo.new(0.9, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
	local Speed = 100
	local Rotation = 0

	local BGRotation = 90
	local BackgroundTween = nil
	local Loop = game:GetService("RunService").RenderStepped:Connect(function(Delta)
		Rotation += Speed * Delta
		Circle.Rotation = Rotation
		if BackgroundTween == nil or BackgroundTween.PlaybackState == Enum.PlaybackState.Completed then
			BackgroundTween = TweenService:Create(self.Instance, TweenInf, {Rotation = BGRotation})
			BackgroundTween:Play()
			BGRotation += 90
		end
	end)
	return Loop
end

function Animations.InfSpin2(self)
	local Speed = 80
	local Loop = game:GetService("RunService").RenderStepped:Connect(function(Delta)
		self.Rotation += Speed * Delta
	end)
	return Loop
end

function Animations.InfSpin3(self)
	local Circle = self.Instance.Circle
	local TweenInf = TweenInfo.new(0.9, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
	local Speed = 100
	local Rotation = 0

	local BGRotation = 90
	local BackgroundTween = nil
	local Loop = game:GetService("RunService").RenderStepped:Connect(function(Delta)
		Rotation += Speed * Delta
		Circle.Rotation = Rotation
		self.Rotation = Rotation
		if BackgroundTween == nil or BackgroundTween.PlaybackState == Enum.PlaybackState.Completed then
			BackgroundTween = TweenService:Create(self.Instance, TweenInf, {Rotation = BGRotation})
			BackgroundTween:Play()
			BGRotation += 90
		end
	end)
	return Loop
end

return Animations
