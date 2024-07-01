import { XTEasyHUD } from '@jxt/xt_hud'
import { BACommonConstants, BALogger } from '@ohos/bacommon'
import { BATextInputView } from '../view/BATextInputView'

@Entry
@Component
export struct BALoginPage {
  @State phone: string = ''
  @State pwd: string = ''
  onClickLoginButton = () => {
  }
  @State isPhoneOrPwdEmpty: boolean = true
  @State isSelectedProtocal: boolean = false

  build() {
    Column() {

      Column() {
        Row() {
          Image($r('app.media.icon_back'))
            .width(28)
            .height(28)// .backgroundColor(Color.Yellow)
            .margin({ left: 20 })
            .alignSelf(ItemAlign.Start)

          Text("密码登录")
            .margin({ right: 20 })

        }
        .width(BACommonConstants.PERSENT_FULL)
        .height(44)
        .margin({ top: 20 })
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.SpaceBetween)

        Text("欢迎登录")
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 40, left: 40 })
          .alignSelf(ItemAlign.Start)

        BATextInputView({
          placeholder: '请填写手机号',
          text: this.phone,
          type: InputType.Number,
          onChange: (value) => {
            this.phone = value
            this.isPhoneOrPwdEmpty = this.phone.length === 0 || this.pwd.length === 0
          }
        })
          .width("90%")
          .height(50)
          .margin({
            top: 80,
            left: 20
          })
          .alignSelf(ItemAlign.Start)

        Row() {
          BATextInputView({
            placeholder: '请填写验证码',
            text: this.pwd,
            type: InputType.Number,
            onChange: (value) => {
              this.pwd = value
              this.isPhoneOrPwdEmpty = this.phone.length === 0 || this.pwd.length === 0
            }
          })
            .width("58%")
            .height(50)
            .margin({
              left: 20
            })

          Button("获取验证码")
            .fontSize(13)
            .backgroundColor($r('app.color.theme_color'))
            .width(100)
            .height(40)
            .enabled(this.phone.length > 1)
            .margin({
              right: 20
            })
            .onClick((event: ClickEvent) => {
              if (!this.isSelectedProtocal) {
                XTEasyHUD.showToast("请先阅读并同意隐私协议")
                return
              }
              if (this.phone.length === 0) {
                XTEasyHUD.showToast("手机号不能为空")
                return
              }
              this.pwd = "123456"
              XTEasyHUD.showToast("获取验证码成功！")
            })
        }
        .margin({
          top: 20
        })
        .width(BACommonConstants.PERSENT_FULL)
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.SpaceBetween)

        Button("登录/注册")
          .fontSize(16)
          .backgroundColor($r('app.color.theme_color'))
          .width("60%")
          .height(50)
          .enabled(!this.isPhoneOrPwdEmpty)
          .margin({
            top: 40
          })
          .onClick(() => {
            if (!this.isSelectedProtocal) {
              XTEasyHUD.showToast("请先阅读并同意隐私协议")
              return
            }
            if (this.phone.length === 0 || this.pwd.length === 0) {
              XTEasyHUD.showToast("账号或密码不能为空！")
              BALogger.info("账号或密码不能为空！", 'BALoginPage')
              return
            }
            this.onClickLoginButton!()
          })
      }
      .width("100%")
      .height("80%")

      Row() {
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Image(this.isSelectedProtocal ? $r("app.media.icon_charge_select") : $r("app.media.icon_charge_unselect"))
        }
        .backgroundColor(Color.Transparent)
        .width(20)
        .height(20)
        .margin({ right: 4 })
        .onClick(() => {
          this.isSelectedProtocal = !this.isSelectedProtocal
        })

        Text("我已阅读并同意")
          .fontSize(14)

        Text("用户协议、隐私保护政策")
          .fontSize(14)
          .fontColor($r('app.color.theme_color'))

      }
      .width("80%")
      .height("20%")
    }
  }
}


