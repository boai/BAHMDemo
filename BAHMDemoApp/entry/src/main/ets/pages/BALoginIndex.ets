import { BALoginPage } from "@ohos/baloginmodule"
import { router } from '@kit.ArkUI'
import { BARouterConstants } from '../Constants/BARouterConstants'

@Entry
@Component
struct BALoginIndex {
  build() {
    Column() {

      BALoginPage({
        onClickLoginButton: () => {
          console.log("点击了【登录】按钮")
          router.pushUrl({url: BARouterConstants.BAROUTER_PATH_TABINDEX})
        }
      })
    }
  }
}


