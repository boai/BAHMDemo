import { BALogger } from '@ohos/bacommon'
import { BALoginPage } from '@ohos/baloginmodule'
import { BARouterConstants } from '../Constants/BARouterConstants'
import { router } from '@kit.ArkUI'

@Entry
@Component
export struct BALoginIndex {
  build() {
    Column() {
      BALoginPage({
        onClickLoginButton: () => {
          BALogger.info("点击了【登录】按钮！", 'BALoginIndex')
          router.replaceUrl({url: BARouterConstants.ROUTER_PATH_TABINDEX}, router.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`Invoke replaceUrl failed, code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info('Invoke replaceUrl succeeded.');
          })
        }
      })
    }
  }
}