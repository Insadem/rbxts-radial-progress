type ProgressCircleUI = Frame & {
    BG: Frame & {
        UICorner: UICorner;
    };
    Circle: CanvasGroup & {
        CenterDot: Frame & {
            UICorner: UICorner;
        };
        UIPadding: UIPadding;
        RightClip: Frame & {
            Circle: Frame & {
                UICorner: UICorner;
                UIGradient: UIGradient;
            };
            HideCircle: Frame & {
                UICorner: UICorner;
                UIGradient: UIGradient;
            };
        };
        HideCircle: Frame & {
            UICorner: UICorner;
        };
        LeftClip: Frame & {
            Circle: Frame & {
                UICorner: UICorner;
                UIGradient: UIGradient;
            };
            HideCircle: Frame & {
                UICorner: UICorner;
                UIGradient: UIGradient;
            };
        };
    };
}

type ProgressUIProperties = Partial<{
    /**
     * Progress of circular progress.
     * From 0 to 100.
     */
    Progress: number,
    /**
     * Rotation of circular progress.
     * From 0 to 360.
     */
    Rotation: number,
    /**
     * Position of circular progress.
     */
    Position: UDim2,
    AnchorPoint: Vector2,
    /**
     * Size of circular progress.
     * From 0 to 1.
     */
    Size: number,
    /**
     * Thickness of circular progress.
     * From 0 to 1.
     */
    Thickness: number,
    /**
     * Length of circle radius.
     * From 0 to 1.
     */
    CircleSize: number,
    /**
     * Color of circular progress.
     */
    Color: Color3,
    /**
     * Background color of circular progress.
     */
    BGColor: Color3,
    /**
     * Transparency of circular progress.
     * From 0 to 1.
     */
    Transparency: number,

    /**
     * Roundness of circular progress background.
     * From 0 to 1.
     */
    BGRoundness: number,
    /**
     * Is circular progress rounded.
     */
    Rounded: boolean,
    Parent: ScreenGui | GuiObject,
}>

type ProgressWorldspaceProperties = Partial<{
    /**
     * Progress of circular progress.
     * From 0 to 100.
     */
    Progress: number,
    Rotation: Vector3,
    Position: Vector3,
    /**
     * How detail is progress bar (more parts if higher number). 
     * From 2 to 10.
     */
    Accuracy: number,

    /**
     * From 2 to 12.
     */
    Thickness: number,
    /**
     * From 0 to 10.
     */
    Radius: number,
    /**
     * Color of circular progress.
     */
    Color: Color3,
    /**
    * From 0 to 1.
    */
    Transparency: number,
    /**
     * Is circular progress rounded.
     */
    Rounded: boolean,
    Parent?: Instance,
}>

interface ProgressWorldspace extends Required<ProgressWorldspaceProperties>
{
    Instance: Folder,
    Tween(tweenInfo: TweenInfo, properties: ProgressWorldspaceProperties): void,
    /**
     * Disconnect all connections related to the progress bar.
     * Call this method when you don't need progress bar anymore.
     */
    Destroy(): void,
}

type ProgressViewportProperties = Partial<{
    Size: UDim2,
    Position: UDim2,
    /**
     * Zoom of progress bar (CurrentCamera.FieldOfView).
     */
    Zoom: number,
    /**
    * Color of circular progress.
    */
    Color: Color3,
    /**
    * From 0 to 1.
    */
    Transparency: number,
    /**
     * @hidden
     */
    _WorldspaceCircle: ProgressWorldspace,
    Parent: ScreenGui | GuiObject,
}>;

// If Viewport and Worlspace have interfere types, then we keep only type of Viewport. So you can change Worldspace properties too via metamethod.
type ViewportAndWorldspaceProperties = ProgressViewportProperties & Pick<ProgressWorldspaceProperties, Exclude<keyof ProgressWorldspaceProperties, keyof ProgressViewportProperties>>;

// type ViewportAndWorldspaceProperties = {
//     [K in keyof ProgressViewportProperties]: K extends keyof ProgressWorldspaceProperties
//         ? ProgressViewportProperties[K] | ProgressWorldspaceProperties[K]
//         : ProgressViewportProperties[K];
// } & {
//     [K in keyof ProgressWorldspaceProperties]: K extends keyof ProgressViewportProperties
//         ? ProgressViewportProperties[K] | ProgressWorldspaceProperties[K]
//         : ProgressWorldspaceProperties[K];
// }

type ProgressViewport = {
    Instance: ViewportFrame,
    Tween(tweenInfo: TweenInfo, properties: ProgressWorldspaceProperties): void,
    /**
     * Disconnect all connections related to the progress bar.
     * Call this method when you don't need progress bar anymore.
     */
    Destroy(): void,
} & Required<ViewportAndWorldspaceProperties>

type CircularProgressInstance = {
    /**
         * Progress circle ui for your customizations.
         */
    Instance: ProgressCircleUI
    Tween(tweenInfo: TweenInfo, properties: ProgressUIProperties): void
    /**
     * Animate progress bar with pre-defined preset.
     */
    Animate(presetName: keyof CircularProgress["PresetAnimations"]): void
    /**
     * Disconnect all connections related to the progress bar.
     * Call this method when you don't need progress bar anymore.
     */
    Destroy(): void
} & Required<ProgressUIProperties>

interface CircularProgress
{
    new(properties?: ProgressUIProperties): CircularProgressInstance,
    fromViewport: (properties?: ViewportAndWorldspaceProperties) => ProgressViewport,
    fromWorldspace: (properties?: ProgressWorldspaceProperties) => ProgressWorldspace,
    /**
     * Preset animations. By default there's 3 of them: InfSpin1, InfSpin2, InfSpin3.
     * You can add any presets that you want. Don't call callbacks directly.
     */
    PresetAnimations: {
        [animationName: string]: (instance: CircularProgressInstance) => void,
    },
}

declare const CircularProgress: CircularProgress;
export = CircularProgress;