import BAConstants from '../common/constants/BAConstants'
import BADimensionUtil from '../common/utils/BADimensionUtil'
import BATabbarModel from '../viewmodel/BATabbarModel'
import BADemoListIndex from './BADemoListIndex'
import BAFileManagerIndex from './BAFileManagerIndex'
import BAWebIndex from './BAWebIndex'

@Entry
@Component
struct BATabbarIndex {
  @State currentPageIndex: number = BAConstants.Default_Tabbar_SelectedIndex

  @Builder BATabbarBuilder(item: BATabbarModel, index: number | undefined) {
    Column() {
      Image(this.currentPageIndex === index ? item.selectedIcon : item.defaultIcon)
        .width(BADimensionUtil.getVp($r('app.float.index_tab_icon_size')))
        .height(BADimensionUtil.getVp($r('app.float.index_tab_icon_size')))
        .objectFit(ImageFit.Contain)
      Text(item.title)
        .fontColor(this.currentPageIndex === index ? $r('app.color.index_tab_font_color') : Color.Black)
        .fontSize(BADimensionUtil.getFp($r('app.float.index_tab_font_size')))
        .margin({ top: BADimensionUtil.getVp($r('app.float.index_tab_vertical_margin')) })
        .opacity(this.currentPageIndex === index
          ? $r('app.float.index_tab_font_selected_opacity')
          : $r('app.float.index_tab_font_default_opacity'))
    }
    .justifyContent(FlexAlign.Center)
    .width(BAConstants.Full_Length)
    .height(BAConstants.Full_Length)
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentPageIndex }) {
      ForEach(BAConstants.TabbarData, (item: BATabbarModel, index: number | undefined) => {
        TabContent() {
          if (index === BAConstants.FILE_MANAGER_Z_INDEX) {
            BAFileManagerIndex()
          } else if (index == 0) {
            BADemoListIndex()
          } else if (index === 2) {
            BAWebIndex()
          }
        }
        .tabBar(this.BATabbarBuilder(item, index))
      }, (item: BATabbarModel) => JSON.stringify(item))
    }
    .width(BAConstants.Full_Length)
    .height(BAConstants.Full_Length)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentPageIndex = index
    })
  }


}