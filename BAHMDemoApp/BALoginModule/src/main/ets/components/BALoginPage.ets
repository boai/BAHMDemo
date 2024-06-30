import { XTEasyHUD } from '@jxt/xt_hud'
import { BALogger } from '@ohos/bacommon'

@Component
export struct BALoginPage {
  @BuilderParam onClickLoginButton?: () => void

  @State phone: string = ''
  @State pwd: string = ''

  build() {
    Column() {
      Text("登 录")
        .margin({ top: 160 })

      TextInput({
        placeholder: "账号",
        text: this.phone
      })
        .width("80%")
        .height(50)
        .margin({
          top: 30
        })
        .onChange((value) => {
          this.phone = value
        })

      TextInput({
        placeholder: "密码",
        text: this.pwd
      })
        .width("80%")
        .height(50)
        .margin({
          top: 20
        })
        .onChange((value) => {
          this.pwd = value
        })

      Button("登录")
        .width("80%")
        .height(50)
        .margin({
          top: 80
        })
        .onClick(() => {
          if (this.phone.length === 0 || this.pwd.length === 0) {
            XTEasyHUD.showToast("账号或密码不能为空！")
            BALogger.info("账号或密码不能为空！", 'BALoginPage')
            return
          }
          this.onClickLoginButton!()
        })

    }
    .width("100%")
    .height("100%")
  }
}