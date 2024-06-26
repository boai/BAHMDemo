import BATabBarItem from '../viewmodel/BATabBarItem'
import { BATabViewModel } from '../viewmodel/BATabViewModel'
import json from '@ohos.util.json'
import { JSON } from '@kit.ArkTS'
import { BACommonConstants } from '@ohos/bacommon'
import { XTEasyHUDToast } from '@jxt/xt_hud/src/main/ets/components/_XTEasyHUD'
import { XTEasyHUD } from '@jxt/xt_hud'
import { BAHomePage } from '@ohos/bahommodule'
import { BAMinePage } from '@ohos/baminemodule'

@Entry
@Component
struct BATabIndex {
  build() {
    Column() {
      BACustomTabIndex()
    }
  }
}

@Component
export struct BACustomTabIndex {
  @State currentPageIndex: number = 0
  @State tabDatas: Array<BATabBarItem> = BATabViewModel.getTabData()

  @Builder
  tabbarBuilder(item: BATabBarItem, index: number | undefined) {
    Column() {
      Image(this.currentPageIndex === index ? item.selectedIcon : item.defaultIcon)
        .width(24)
        .height(24)
      Text(item.title)//"#1AAD19"
        .fontColor(this.currentPageIndex === index ? $r('app.color.theme_color') : Color.Gray)
        .fontSize(12)
        .margin({ top: 4 })
        .opacity(this.currentPageIndex === index ? 1 : 0.7)
    }
    .justifyContent(FlexAlign.Center)
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, index: this.currentPageIndex }) {
        ForEach(this.tabDatas, (item: BATabBarItem, index: number) => {
          TabContent() {
            if (index === 0) {
              BAHomePage()
            } else if (index === this.tabDatas.length - 1) {
              BAMinePage()
            }
          }
          .tabBar(this.tabbarBuilder(item, index))
        }, (item: BATabBarItem) => JSON.stringify(item))
      }
      .onChange((index: number) => {
        this.currentPageIndex = index
      })
    }
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
  }
}
