import router from '@ohos.router'
import App from '@system.app';
import Prompt from '@system.prompt';
import CommonConstats from '../common/CommonConstats';
import BALogger from '../utils/BALogger'
import prompt from '@ohos.promptAction';

@Extend(TextInput) function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .width(CommonConstats.FULL_PARENT)
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .padding({
    left: CommonConstats.INPUT_ACCOUNT_LENGTH
  })
  .margin({
    top: $r('app.float.input_margin_top')
  })
}

@Extend(Line) function lineStyle() {
  .width(CommonConstats.FULL_PARENT)
  .height($r('app.float.line_height'))
  .backgroundColor($r('app.color.line_color'))
}

@Extend(Text) function blueTextStyle() {
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
}

@Entry
@Component
struct LoginPage {
  @State account: string = ''
  @State pwd: string = ''
  @State isShowLoading: boolean = false
  private timeOutId: number = -1


  aboutToDisappear() {
    clearTimeout(this.timeOutId)
    this.timeOutId = -1
  }

  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height($r('app.float.other_login_image_size'))
    .width($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
  }

  build() {

    Column() {

      Image($r('app.media.logo'))
        .width($r('app.float.logo_image_size'))
        .height($r('app.float.logo_image_size'))
        .margin({
          top: $r('app.float.logo_margin_top'),
          bottom: $r('app.float.logo_margin_bottom')
        })

      Text($r('app.string.login_page'))
        .fontSize($r('app.float.page_title_text_size'))
        .fontColor($r('app.color.title_text_color'))
        .fontWeight(FontWeight.Medium)

      Text($r('app.string.login_more'))
        .fontSize($r('app.float.normal_text_size'))
        .fontColor($r('app.color.login_more_text_color'))
        .margin({
          top: $r('app.float.login_more_margin_top'),
          bottom: $r('app.float.logo_margin_bottom')
        })

      TextInput({
        placeholder: $r('app.string.account')
      })
        .maxLength(CommonConstats.INPUT_ACCOUNT_LENGTH)
        .type(InputType.Number)
        .inputStyle()
        .onChange((value: string) => {
          this.account = value
        })

      Line().lineStyle()

      TextInput({ placeholder: $r('app.string.password') })
        .maxLength(CommonConstats.INPUT_PASSWORD_LENGTH)
        .type(InputType.Password)
        .inputStyle()
        .onChange((value: string) => {
          this.pwd = value
        })

      Line().lineStyle()

      Row() {
        Text($r('app.string.message_login')).blueTextStyle()
        Text($r('app.string.forgot_password')).blueTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width(CommonConstats.FULL_PARENT)
      .margin({ top: $r('app.float.forgot_margin_top') })

      Button($r('app.string.login'), { type: ButtonType.Capsule })
        .width(CommonConstats.BUTTON_WIDTH)
        .height($r('app.float.login_button_height'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.login_button_color'))
        .margin({ top: $r('app.float.login_button_margin_top'), bottom: $r('app.float.login_button_margin_bottom') })
        .onClick(() => {
          this.onLogin()
        })

      if (this.isShowLoading) {
        LoadingProgress()
          .color($r('app.color.loading_color'))
          .width($r('app.float.login_progress_size'))
          .height($r('app.float.login_progress_size'))
          .margin({ top: $r('app.float.login_progress_margin_top') })
      }

      Blank()
      Text($r('app.string.other_login_method'))
        .fontColor($r('app.color.other_login_text_color'))
        .fontSize($r('app.float.little_text_size'))
        .fontWeight(FontWeight.Medium)
        .margin({ top: $r('app.float.other_login_margin_top'), bottom: $r('app.float.other_login_margin_bottom') })

      Row({ space: CommonConstats.LOGIN_METHODS_SPACE }) {
        this.imageButton($r('app.media.login_method1'))
        this.imageButton($r('app.media.login_method2'))
        this.imageButton($r('app.media.login_method3'))
      }

    }
    .backgroundColor("#F1F3F5")
    .width("100%")
    .height("100%")
    .padding({
      left: 12,
      right: 12,
      bottom: 24
    })
  }

  onLogin(): void {
    if (this.account === '' || this.pwd === '') {
      prompt.showToast({
        message: $r('app.string.input_empty_tips')
      })
    } else {
      this.isShowLoading = true
      if (this.timeOutId == -1) {
        this.timeOutId = setTimeout(() => {
          this.isShowLoading = false
          this.timeOutId = -1
          router.replaceUrl({
            url: "pages/HomePage"
          })

        }, CommonConstats.LOGIN_DELAY_TIME)
      }
    }
  }

}