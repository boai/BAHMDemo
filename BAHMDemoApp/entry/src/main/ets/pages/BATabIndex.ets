import BATabBarItem from '../viewmodel/BATabBarItem'
import { BATabViewModel } from '../viewmodel/BATabViewModel'
import json from '@ohos.util.json'
import { JSON } from '@kit.ArkTS'
import { BACommonConstants } from '@ohos/bacommon'

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

  @Builder
  tabbarBuilder(item: BATabBarItem, index: number | undefined) {
    Column() {
      Image(this.currentPageIndex === index ? item.selectedIcon : item.defaultIcon)
        .width(24)
        .height(24)
      Text(item.title)
        .fontColor(this.currentPageIndex === index ? Color.Blue : Color.Gray)
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
        ForEach(BATabViewModel.getTabData(), (item: BATabBarItem, index: number) => {
          TabContent() {

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
