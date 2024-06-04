import web_webview from '@ohos.web.webview';
import BAConstants from '../common/constants/BAConstants';
import BALogger from '../common/utils/BALogger';

// 订阅一次指定类型Web事件的回调。
web_webview.once('webInited', () => {
  BALogger.info('setCookie', 'BAWebIndex')
  // web_webview.WebCookieManager.setCookie('www.baidu.com', 'a=b')
})

@Component
export default struct BAWebIndex {
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  @State webResult: string = ''

  build() {
    Column() {
      Web({
        src: 'www.baidu.com',
        controller: this.controller
      })
        .zoomAccess(true)
        .onConfirm((event) => {
          AlertDialog.show({
            title: '温馨提醒',
            message: '确定要点击确定吗？',
            confirm: {
              value: 'onAlert',
              action: () => {
                event.result.handleConfirm()
              }
            },
            cancel: () => {
              event.result.handleCancel()
            }
          })
          return true
        })
        .javaScriptAccess(true)
        .onPageEnd(e => {
          try {
            this.controller.runJavaScript(
              'test()',
              (error, result) => {
                if (error) {
                  BALogger.error('run JavaScript error: ' + JSON.stringify(error), 'BAWebIndex')
                  return
                }
                if (result) {
                  this.webResult = result
                  BALogger.info(`The test() return value is: ${result}`, 'BAWebIndex')
                }
              }
            )
            BALogger.info(`url：${e.url}}`, `BAWebIndex`)
          } catch (error) {
            BALogger.error(`ErrorCode：${error.code}，Message：${error.message}`)
          }
        })
    }
    .height(BAConstants.Full_Length)
  }
}