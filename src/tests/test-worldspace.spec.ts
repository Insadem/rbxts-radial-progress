import { CircularProgress } from "index";

const ProgressBar = CircularProgress.fromViewport();
ProgressBar.Accuracy = 6;
ProgressBar.Progress = 50;
ProgressBar.Thickness = 8;
assert(ProgressBar._WorldspaceCircle.Accuracy === 6);

let Toggle = true;

game.GetService("RunService").Heartbeat.Connect((delta) =>
{
    if (ProgressBar.Thickness <= 2 && Toggle === false) Toggle = true;
    if (ProgressBar.Thickness > 10 && Toggle === true) Toggle = false;

    if (!Toggle) delta = -delta;

    ProgressBar.Thickness += 4 * delta;
    ProgressBar.Radius += 3 * delta;
    ProgressBar.Progress += 10 * delta;
});

const ProgressBar2 = CircularProgress.fromWorldspace();
ProgressBar2.Position = new Vector3(0, 30, 0);
ProgressBar2.Progress = 50;
ProgressBar2.Parent = game.Workspace;

task.wait(1);
const TweenInf = new TweenInfo(2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out);
ProgressBar2.Tween(TweenInf, { Position: new Vector3(0, 0.5, 0) });