import { XTEasyHUD, XTHUDToastOptions } from '@jxt/xt_hud';
import { router } from '@kit.ArkUI';
import { BALogger } from '@ohos/bacommon';
import { BARouterConstants } from '../Constants/BARouterConstants';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    // Toast 全局配置，如无特殊需要，可以不配置，其他 HUD 同理
    XTEasyHUD.globalConfigToast((options: XTHUDToastOptions) => {
      options.isQueueMode = false
      options.hidingDelay = 1000
      options.isModal = false
      options.alignment = DialogAlignment.Center
      // options.textColor = Color.Red
    })
  }

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
          BALogger.info("点击了【点击登录】按钮", 'Index')
          router.replaceUrl({
            url: BARouterConstants.ROUTER_PATH_LOGININDEX // 目标url
          }, router.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`Invoke replaceUrl failed, code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info('Invoke replaceUrl succeeded.');
          })
        })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}