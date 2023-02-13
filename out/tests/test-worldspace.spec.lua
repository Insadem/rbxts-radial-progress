-- Compiled with roblox-ts v2.0.4
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local CircularProgress = TS.import(script, game:GetService("ReplicatedStorage"), "MainModule")
local ProgressBar = CircularProgress.fromViewport()
ProgressBar.Accuracy = 6
ProgressBar.Progress = 50
ProgressBar.Thickness = 8
local _arg0 = ProgressBar._WorldspaceCircle.Accuracy == 6
assert(_arg0)
local Toggle = true
game:GetService("RunService").Heartbeat:Connect(function(delta)
	if ProgressBar.Thickness <= 2 and Toggle == false then
		Toggle = true
	end
	if ProgressBar.Thickness > 10 and Toggle == true then
		Toggle = false
	end
	if not Toggle then
		delta = -delta
	end
	ProgressBar.Thickness += 4 * delta
	ProgressBar.Radius += 3 * delta
	ProgressBar.Progress += 10 * delta
end)
local ProgressBar2 = CircularProgress.fromWorldspace()
ProgressBar2.Position = Vector3.new(0, 30, 0)
ProgressBar2.Progress = 50
ProgressBar2.Parent = game.Workspace
task.wait(1)
local TweenInf = TweenInfo.new(2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
ProgressBar2:Tween(TweenInf, {
	Position = Vector3.new(0, 0.5, 0),
})
