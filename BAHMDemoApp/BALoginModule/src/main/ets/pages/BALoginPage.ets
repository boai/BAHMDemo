
@Entry
@Component
export struct BALoginPage {
  build() {
    Column() {
      Text("登 录")
        .margin({ top: 60 })

      TextInput({
        placeholder: "账号"
      })
        .width("80%")
        .height(50)
        .margin({
          top: 30
        })

      TextInput({
        placeholder: "密码"
      })
        .width("80%")
        .height(50)
        .margin({
          top: 30
        })

      Button("登录")
        .width("80%")
        .height(50)
        .margin({
          top: 30
        })

    }
    .width("100%")
    .height("100%")
  }
}