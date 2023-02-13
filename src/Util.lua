local Util = {}

type range = {number}
export type propertyTable = {[string]: any}

function Util.ShiftRange(Range1: Range, Range2: Range, Value: number)
	return Range2[1] + ((Range2[2] - Range2[1]) / (Range1[2] - Range1[1])) * (Value - Range1[1])
end

function Util.GetAlphaValue(Start: number, End: number, Alpha: number)
	return Start + ((End - Start) * Alpha)
end

Util.TweenService = {}
Util.TweenService.__index = Util.TweenService
local RunningTweens = {}

function Util.TweenService.new(Object)
	local TweenService = {}
	TweenService.Object = Object
	
	local Metatable = setmetatable(TweenService, Util.TweenService)
	RunningTweens[Metatable] = {}
	
	return Metatable
end

function Util.TweenService:Add(Loop: BindableFunction) --add a function to deletion queue
	table.insert(RunningTweens[self], Loop)
end


function Util.TweenService:Tween(TweenInfo: TweenInfo, Properties: propertyTable)
	local TweenService = game:GetService("TweenService")
	local PropertyCache = {}

	--Cache the properties to use as the beginning keyframe for tweening
	for i, v in pairs(Properties) do
		PropertyCache[i] = self.Object[i]
	end

	local TimeGoal = TweenInfo.Time
	local RepeatCount = TweenInfo.RepeatCount
	local TimeDelay = TweenInfo.DelayTime
	local Reversing = false
	local Time = 0
	local UID = {}

	local PlayTween = game:GetService("RunService").RenderStepped:Connect(function(Delta)
		if Reversing == false then Time += Delta else Time -= Delta end
		if Time >= TimeDelay or Reversing then
			--Position in the tween keyframes
			local TimeAlpha = (Time - TimeDelay) / TimeGoal

			--Check if repeats have run out
			if RepeatCount <= -1 then
				RunningTweens[self][UID]:Disconnect()
				RunningTweens[self][UID] = nil
				return
			end

			--Check if the animation has ended or if it's reversing
			if TimeAlpha >= 1 then
				if TweenInfo.Reverses == true then
					Reversing = true
				else
					Time = 0
					RepeatCount -= 1
				end
			elseif TimeAlpha <= 0 then
				Reversing = false
				Time = 0
				RepeatCount -= 1
			end

			--Get the correct alpha value for setting up tween keyframes
			local Alpha = TweenService:GetValue(TimeAlpha, TweenInfo.EasingStyle, TweenInfo.EasingDirection)
			
			--Support other data types
			for i, v in pairs(Properties) do
				if typeof(v) == "number" then
					self.Object[i] = Util.GetAlphaValue(PropertyCache[i], v, Alpha)
				elseif typeof(v) == "UDim2" then
					local NewUdim2 = UDim2.new(Util.GetAlphaValue(PropertyCache[i].X.Scale, v.X.Scale, Alpha), Util.GetAlphaValue(PropertyCache[i].X.Offset, v.X.Offset, Alpha), Util.GetAlphaValue(PropertyCache[i].Y.Scale, v.Y.Scale, Alpha), Util.GetAlphaValue(PropertyCache[i].Y.Offset, v.Y.Offset, Alpha))
					self.Object[i] = NewUdim2
				elseif typeof(v) == "Vector2" then
					local NewVector2 = Vector2.new(Util.GetAlphaValue(PropertyCache[i].X, v.X, Alpha), Util.GetAlphaValue(PropertyCache[i].Y, v.Y, Alpha))
					self.Object[i] = NewVector2
				elseif typeof(v) == "Vector3" then
					local NewVector3 = Vector3.new(Util.GetAlphaValue(PropertyCache[i].X, v.X, Alpha), Util.GetAlphaValue(PropertyCache[i].Y, v.Y, Alpha), Util.GetAlphaValue(PropertyCache[i].Z, v.Z, Alpha))
					self.Object[i] = NewVector3
				elseif typeof(v) == "Color3" then
					local NewColor = Color3.new(Util.GetAlphaValue(PropertyCache[i].R, v.R, Alpha), Util.GetAlphaValue(PropertyCache[i].G, v.G, Alpha), Util.GetAlphaValue(PropertyCache[i].B, v.B, Alpha))
					self.Object[i] = NewColor
				end
			end
		end
	end)
	RunningTweens[self][UID] = PlayTween
end

function Util.TweenService:Destroy()
	for i, v in pairs(RunningTweens[self]) do v:Disconnect() end
	RunningTweens[self] = nil
	
	setmetatable(self, nil)
end

return Util
