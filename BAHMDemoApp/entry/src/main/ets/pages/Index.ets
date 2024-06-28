import { router } from '@kit.ArkUI';
import { BARouterConstants } from '../Constants/BARouterConstants';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Button("点击登录")
        .margin({top: 40})
        .width("60%")
        .height(50)
        .onClick(() => {
          console.log("点击了【点击登录】按钮")
          router.pushUrl({ url: BARouterConstants.BAROUTER_PATH_LOGIN })
        })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}