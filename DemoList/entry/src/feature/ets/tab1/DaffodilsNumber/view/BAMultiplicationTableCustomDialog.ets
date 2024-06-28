import { BACommonConstant } from '../../../../../Util/Constant/BACommonConstant'

@CustomDialog
export struct BAMultiplicationTableCustomDialog {
  IsPalindromicStringCustomDialogController ?: CustomDialogController

  build() {
    Column() {
      Column() {
        Text("ArkTS开发案例")
          .height(40)
          .font({ size: 30 })
          .fontColor(Color.Red)
          .margin({ top: 8 })
        Text("九九乘法表")
          .font({ size: 20 })
          .fontColor(Color.Yellow)
          .margin({ left: 10 })
      }
      .alignItems(HorizontalAlign.Center)
      .width(BACommonConstant.kFULL_WIDTH)
      .height(72)

      Text("请查看日志打印")
        .font({ size: 12 })
        .fontColor(Color.Blue)
        .margin({ top: 24 })
    }
    .alignItems(HorizontalAlign.Center)
    .padding({
      left: 24,
      right: 24,
      bottom: 24
    })
  }
}
