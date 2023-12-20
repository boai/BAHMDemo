import { BACommonConstants } from '../constants/BACommonConstants'

@CustomDialog
export default struct BAAddTargetDialog {
  @State subTaskName: string = ''
  private controller?: CustomDialogController
  onClickOk?: (value: string) => void

  build() {
    Column() {
      Text($r('app.string.add_task_dialog'))
        .width(BACommonConstants.FULL_WIDTH)
        .fontWeight(BACommonConstants.FONT_WEIGHT)
        .fontSize($r('app.float.secondary_title'))
        .fontColor($r('app.color.title_black_color'))
        .textAlign(TextAlign.Start)

      TextInput({ placeholder: $r('app.string.input_target_name') })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: $r('app.float.list_font') })
        .caretColor(Color.Blue)
        .backgroundColor($r('app.color.input_background'))
        .width(BACommonConstants.FULL_WIDTH)
        .height(BACommonConstants.DIALOG_INPUT_HEIGHT)
        .margin({ top: BACommonConstants.DIALOG_INPUT_MARGIN })
        .fontSize($r('app.float.list_font'))
        .fontColor($r('app.color.title_black_color'))
        .onChange((value: string) => {
          this.subTaskName = value
        })

      Blank()
      Row() {
        Button($r('app.string.cancel_button'))
          .dialogButtonStyle()
          .onClick(() => {
            this.controller?.close()
          })

        Divider()
          .vertical(true)

        Button($r('app.string.confirm_button'))
          .dialogButtonStyle()
          .onClick(() => {
            if (this.onClickOk !== undefined) {
              this.onClickOk(this.subTaskName)
            }
          })
      }
      .width(BACommonConstants.DIALOG_OPERATION_WIDTH)
      .height(BACommonConstants.DIALOG_OPERATION_HEIGHT)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding(24)
    .height(168)
    .width(BACommonConstants.DIALOG_WIDTH)
    .borderRadius(BACommonConstants.DIALOG_BORDER_RADIUS)
    .backgroundColor(Color.White)
  }
}

@Extend(Button) function dialogButtonStyle() {
  .fontColor($r('app.color.main_blue'))
  .fontSize(16)
  .height(32)
  .width(96)
  .backgroundColor(Color.White)
}

