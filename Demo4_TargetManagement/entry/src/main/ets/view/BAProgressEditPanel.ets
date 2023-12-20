import { BACommonConstants } from '../constants/BACommonConstants'

@Component
export default struct BAProgressEditPanel {
  @Link sliderMode: number
  @Prop slidingProgress: number = 0
  onCancel?: () => void
  onClickOK?: (progress: number) => void

  build() {
    Column() {
      Row() {
        Slider({
          value: this.slidingProgress,
          min: BACommonConstants.SLIDER_MIN_VALUE,
          max: BACommonConstants.SLIDER_MAX_VALUE,
          style: SliderStyle.InSet,
          step: BACommonConstants.SLIDER_STEP
        })
          .width(BACommonConstants.SLIDER_INNER_WIDTH)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.slidingProgress = Math.floor(value)
            this.sliderMode = mode
          })
        Text(`${this.slidingProgress}%`)
          .fontSize(14)
          .fontWeight(BACommonConstants.FONT_WEIGHT)
          .fontColor($r('app.color.dialog_progress'))
          .textAlign(TextAlign.Center)
          .margin({ left: 8 })
      }
      .width(BACommonConstants.SLIDER_WIDTH)
      .height(BACommonConstants.SLIDER_HEIGHT)

      Row() {
        CustomButton({
          buttonText: $r('app.string.cancel_button')
        })
          .onClick(() => {
            if (this.onCancel !== undefined) {
              this.onCancel();
            }
          })
        CustomButton({
          buttonText: $r('app.string.confirm_button')
        })
          .onClick(() => {
            if (this.onClickOK !== undefined) {
              this.onClickOK(this.slidingProgress);
            }
          })
      }
      .margin({ top: BACommonConstants.SLIDER_BUTTON_MARGIN })
      .width(BACommonConstants.DIALOG_OPERATION_WIDTH)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .height(84)
    .width(BACommonConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.End)
  }
}

@Component
struct CustomButton {
  @State buttonColor: Resource = $r('app.color.start_window_background')
  buttonText?: Resource

  build() {
    Text(this.buttonText)
      .dialogButtonStyle()
      .backgroundColor(this.buttonColor)
      .borderRadius(BACommonConstants.LIST_RADIUS)
      .textAlign(TextAlign.Center)
      .onTouch((event?: TouchEvent) => {
        if (event !== undefined && event.type === TouchType.Down) {
          this.buttonColor = $r('app.color.custom_button_color')
        }
        if (event !== undefined && event.type === TouchType.Up) {
          this.buttonColor = $r('app.color.start_window_background')
        }
      })
  }
}

@Extend(Text) function dialogButtonStyle() {
  .fontSize(16)
  .height(32)
  .width(96)
  .fontColor($r('app.color.main_blue'))
}