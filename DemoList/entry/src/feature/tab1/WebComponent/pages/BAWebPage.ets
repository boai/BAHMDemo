// import { webview } from '@kit.ArkWeb'
// import { router } from '@kit.ArkUI'

import router from '@ohos.router';
import webview from '@ohos.web.webview';
import prompt from '@ohos.promptAction';

import { BACommonConstant } from '../../../../Util/Constant/BACommonConstant'
import { BANavigatorModel } from '../viewModel/BANavigatorModel'

@Component
export struct BAWebPage {
  webController: webview.WebviewController = new webview.WebviewController()
  @State params: object = { path: "", tips: "Local" } as BANavigatorModel //router.getParams()
  @State progressVal: number = 0
  @State isLoading: boolean = true
  @State intervalLoading: number = -1
  @State path: string | Resource = $rawfile('index.html')

  aboutToAppear(): void {
    this.intervalLoading = setInterval(() => {
      this.progressVal = this.progressVal >= BACommonConstant.WebConstant_PROGRESS_MAX ? BACommonConstant.WebConstant_PROGRESS_MIN : (this.progressVal + BACommonConstant.WebConstant_PROGRESS_STEP)
    }, BACommonConstant.WebConstant_MILLI_SECONDS)
  }

  build() {

    Stack() {
      Image($r("app.media.background"))
        .width(BACommonConstant.kFULL_WIDTH)
        .height("38.7%")

      Row() {
        Column() {
          Row() {
            Image($rawfile("img/ic_public_back.png"))
              .width("5.6%")
              .height("32%")
              .margin({ left: "7.2%" })
              .onClick(() => {
                router.back()
              })
            Text("Sweepstakes App")
              .fontSize(20)
              .width("82.2%")
              .height("50%")
              .fontColor($r("app.color.black"))
              .margin({ left: "5%" })
          }
          .height("7.2%")

          Web({ src: this.path, controller: this.webController })
            .zoomAccess(false)
            .width("93.3%")
            .aspectRatio(1)
            .margin({ left: "3.3%", right: "3.3%", top: '7.1%' })
            .onConfirm((event) => {
              AlertDialog.show({
                message: '恭喜您抽中:' + event?.message,
                confirm: {
                  value: "确定",
                  action: () => {
                    event?.result.handleConfirm()
                  }
                },
                cancel: () => {
                  event?.result.handleCancel()
                }
              })
              return true
            })
            .onErrorReceive((event) => {
              if (event?.error.getErrorInfo() === 'ERR_INTERNET_DISCONNECTED') {
                prompt.showToast({
                  message: "网络加载失败！",
                  duration: BACommonConstant.WebConstant_DURATION
                })
              }
              if (event?.error.getErrorInfo() == 'ERR_CONNECTION_TIMED_OUT') {
                prompt.showToast({
                  message: "网络加载失败！",
                  duration: BACommonConstant.WebConstant_DURATION
                })
              }
            })
            .onProgressChange((event) => {
              if (event?.newProgress === BACommonConstant.WebConstant_PROGRESS_MAX) {
                this.isLoading = false
                clearInterval(this.intervalLoading)
                this.intervalLoading = -1
              }
            })

          Column() {
            Text("以上为Web组件")
              .fontSize(18)
              .textAlign(TextAlign.Center)
              .fontColor("#182431")// .width("")
              .height("3.1%")
              .fontWeight(500)
              .margin({ top: '3.1%' })

            Text(this.params['tips'])
              .fontSize(18)
              .textAlign(TextAlign.Center)
              .fontColor("#182431")
              .width('15.6%')
              .height('2.4%')
              .opacity(0.6)
              .margin({ top: '0.9%' })
          }

          Button("点击抽奖")
            .fontSize(16)
            .fontColor($r("app.color.start_window_background"))
            .margin({ top: "10%" })
            .width("86.7%")
            .height("5.1%")
            .backgroundColor($r("app.color.blue"))
            .borderRadius(20)
            .onClick(() => {
              this.webController.runJavaScript('startDraw()')
            })
        }
        .width(BACommonConstant.kFULL_WIDTH)
        .height(BACommonConstant.kFULL_HEIGHT)
      }

      if (this.isLoading) {
        Progress({
          value: BACommonConstant.WebConstant_PROGRESS_MIN,
          total: BACommonConstant.WebConstant_PROGRESS_MAX,
          type: ProgressType.ScaleRing
        })
          .color(Color.Gray)
          .value(this.progressVal)
          .width(BACommonConstant.WebConstant_PROGRESS_WIDTH)
          .style({
            strokeWidth: BACommonConstant.WebConstant_PROGRESS_STROKE_WIDTH,
            scaleWidth: BACommonConstant.WebConstant_PROGRESS_SCALE_WIDTH,
            scaleCount: BACommonConstant.WebConstant_PROGRESS_SCALE_COUNT
          })
          .zIndex(1)
          .position({
            x: BACommonConstant.WebConstant_PROGRESS_POSITION_X,
            y: BACommonConstant.WebConstant_PROGRESS_POSITION_Y
          })
      }
    }
    .backgroundColor($r("app.color.navy_blue"))
  }
}