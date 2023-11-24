import CommonConstant from '../common/constant/CommonConstant'

@Component
export default struct BAToDoItem {
  private content?: string
  @State isComplete: boolean = false

  @Builder labelIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }

  build() {
    Row() {
      if (this.isComplete) {
        this.labelIcon($r('app.media.ic_ok'))
      } else {
        this.labelIcon($r('app.media.ic_default'))
      }

      Text(this.content)
        .fontSize($r('app.float.item_font_size'))
        .fontWeight(CommonConstant.FONT_WEIGHT)
        .opacity(this.isComplete ? CommonConstant.OPACITY_COMPLETED : CommonConstant.OPACITY_DEFAULT)
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .borderRadius(CommonConstant.BORDER_RADIUS)
    .backgroundColor($r('app.color.start_window_background'))
    .width(CommonConstant.LIST_DEFAULT_WIDTH)
    .height($r('app.float.list_item_height'))
    .onClick(() => {
      this.isComplete = !this.isComplete
    })
  }
}





