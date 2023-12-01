
import app from '@system.app';
import CommonConstats from '../common/CommonConstats'
import HomeView from '../view/HomeView'
import SettingView from '../view/SettingView'


@Entry
@Component
 struct HomePage {

  @State currentIndex: number = CommonConstats.MINE_TAB_INDEX
  private tabsController: TabsController = new TabsController()

  onPageShow() {
    this.tabsController.changeIndex(this.currentIndex)
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      TabContent() {
        HomeView()
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder(CommonConstats.HOME_TITLE, CommonConstats.HOME_TAB_INDEX, $r('app.media.home_normal'), $r('app.media.home_selected')))

      TabContent() {
        SettingView()
      }
      .padding({ left: $r('app.float.mainPage_padding'), right: $r('app.float.mainPage_padding') })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuilder(CommonConstats.MINE_TITLE, CommonConstats.MINE_TAB_INDEX, $r('app.media.mine_normal'), $r('app.media.mine_selected')))
    }
    .width(CommonConstats.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight($r('app.float.mainPage_barHeight'))
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index
    })

  }

  @Builder TabBuilder(title: string, index: number, normalImg: Resource, selectedImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg:normalImg)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.main_tab_fontSize'))
        .fontColor(this.currentIndex === index ? $r('app.color.mainPage_selected'):$r('app.color.mainPage_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width(CommonConstats.FULL_PARENT)
    .onClick(() => {
      this.currentIndex = index
      this.tabsController.changeIndex(this.currentIndex)
    })
  }


}