Circular progress package for all your needs!<br/>
You can find examples of use in src/tests.<br/>
Documentation & other info: [link](https://devforum.roblox.com/t/circular-radial-progress-bar-rounded/1594512).<br/>
Repository: [link](https://github.com/Insadem/rbxts-radial-progress).<br/>
Author: [HintSystem](https://www.roblox.com/users/283367718/profile).<br/>
Typings & slight changes: [Insadem](https://www.roblox.com/users/1644392228/profile).<br/>

Simple example of usage:<br/>
```TS
import CircularProgress from "rbxts-radial-progress";

const LoadCircle = new CircularProgress({
    Position: UDim2.fromScale(0.04, 0.65),
    Color: Color3.fromRGB(255, 69, 72),
    AnchorPoint: new Vector2(0, 1),
    BGRoundness: 1,
    Thickness: 0.5
});
LoadCircle.Animate("InfSpin2");
```