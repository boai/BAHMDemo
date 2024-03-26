@Component
export default struct BATextInputWidget {
  private inputImage?: Resource
  private hintText?: Resource

  build() {
    Row() {
      Image(this.inputImage !== undefined ? this.inputImage : '')
        .width(24)
        .height(24)
        .margin({
          left: 12
        })
      TextInput({ placeholder: this.hintText })
        .fontSize(16)
        .padding({
          left: 12
        })
        .placeholderColor($r('app.color.place_color'))
        .backgroundColor(Color.White)
        .fontWeight(FontWeight.Normal)
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Black)
        .margin({
          right: 32
        })
        .layoutWeight(1)
        .height(48)
    }
    .margin({
      top:24
    })
    .borderRadius(24)
    .backgroundColor(Color.White)
    .width('93%')
    .height(64)
  }
}