import { BACommonConstant } from '../../../../Util/Constant/BACommonConstant'
import { BANavigatorModel } from '../viewModel/BANavigatorModel'
// import { router } from '@kit.ArkUI'
import router from '@ohos.router'

@Extend(Button)
function fancy(top: string) {
  .fontSize(16)
  .fontColor(Color.White)
  .width("40%")
  .height("5.1%")
  .margin({ top: top })
  .backgroundColor($r("app.color.blue"))
  .borderRadius(20)
}

@Component
export struct BAWebComponentPage {
  build() {

    Column() {
      Image($r("app.media.background"))
        .width(BACommonConstant.kFULL_WIDTH)
        .height("38%")

      Button("loadLocalH5")
        .fancy("4.6%")
        .onClick(() => {
          router.pushUrl({
            url: "/pages/BAWebPage",
            params: {path: BACommonConstant.kPAGE_WEB_URI, tips: "Local" } as BANavigatorModel
          },
            router.RouterMode.Standard, (error) => {
              if (error) {
                console.error(`Invoke pushUrl failed, code is ${error.code}, message is ${error.message}`);
                return;
              }
              console.info('Invoke pushUrl succeeded.');
            })
        })

      Button("load cloud H5")
        .fancy("3.1%")
        .onClick(() => {
          router.pushUrl({
            url: "/pages/BAWebPage",
            params: {path: BACommonConstant.kPAGE_WEB_URI, tips: "online"} as BANavigatorModel
          },
            router.RouterMode.Standard, (error) => {
              if (error) {
                console.error(`Invoke pushUrl failed, code is ${error.code}, message is ${error.message}`);
                return;
              }
              console.info('Invoke pushUrl succeeded.');
            })
        })
      // Navigator({target: BACommonConstant.kPAGE_WEB_URI, type: NavigationType.Push}) {
      //   Button("loadLocalH5")
      //     .fancy("4.6%")
      // }
      // .params({path: BACommonConstant.kPAGE_WEB_URI, tips: "Local" } as BANavigatorModel)
      //
      // Navigator({target: BACommonConstant.kPAGE_WEB_URI, type: NavigationType.Push}) {
      //   Button("load cloud H5")
      //     .fancy("3.1%")
      // }
      // .params({path: BACommonConstant.kPAGE_WEB_URI, tips: "online"} as BANavigatorModel)
    }
    .height(BACommonConstant.kFULL_HEIGHT)
    .backgroundColor($r("app.color.navy_blue"))
  }
}

