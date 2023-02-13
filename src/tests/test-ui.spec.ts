import CircularProgress from "index";

game.GetService("StarterGui").SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);

// New progress circle
const LoadCircle1 = new CircularProgress();
LoadCircle1.AnchorPoint = new Vector2(0, 1);
LoadCircle1.Animate("InfSpin1");

// New progress circle, customize the properties in the function like this > Circle.new({Thickness = 0.3})
const LoadCircle2 = new CircularProgress({
    Position: UDim2.fromScale(0.04, 0.65),
    Color: Color3.fromRGB(255, 69, 72),
    AnchorPoint: new Vector2(0, 1),
    BGRoundness: 1,
    Thickness: 0.5
});
LoadCircle2.Animate("InfSpin2");

// New progress circle
const LoadCircle3 = new CircularProgress({ BGColor: Color3.fromRGB(23, 27, 85), Position: UDim2.fromScale(0.04, 0.65) });
LoadCircle3.Color = new Color3(1, 1, 1);
LoadCircle3.BGRoundness = 0.1;
LoadCircle3.AnchorPoint = new Vector2(0.5, 0.5); // By default the anchor point is(0, 1) set it to(0, 0) if you need to
LoadCircle3.Thickness = 0.5;
LoadCircle3.CircleSize = 0.8;
LoadCircle3.Transparency = 0.7;
LoadCircle3.Animate("InfSpin3");

task.wait(1)
const TweenInf = new TweenInfo(3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out);
LoadCircle3.Tween(TweenInf, { Color: Color3.fromRGB(89, 164, 255), AnchorPoint: new Vector2(0.5, 0.5), Position: UDim2.fromScale(0.65, 0.85), Transparency: 0 })

CircularProgress.PresetAnimations["Test"] = (instance) =>
{
    task.spawn(() =>
    {
        while (task.wait(1))
        {
            instance.Tween(new TweenInfo(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
                Rotation: instance.Rotation -= 90,
            });
        };
    });
};

print(CircularProgress.PresetAnimations);
const LoadCircle4 = new CircularProgress();
LoadCircle4.Animate("Test");
LoadCircle4.BGColor = Color3.fromRGB(5, 227, 97);
LoadCircle4.Position = UDim2.fromScale(0.75, 0.25);