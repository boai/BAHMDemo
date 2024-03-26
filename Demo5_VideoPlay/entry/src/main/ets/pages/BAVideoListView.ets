import { LIST, MARGIN_FONT_SIZE, ALL_PERCENT } from '../common/constants/BACommonConstants'
import { BAIndexModuleView } from '../view/BAIndexModuleView'
import { BASwiperView } from '../view/BASwiperView'

@Entry
@Component
struct BAVideoListView {
  build() {

    Column({ space: MARGIN_FONT_SIZE.FOURTH_MARGIN }) {
      BASwiperView()
      List() {
        ForEach(LIST, (item: string) => {
          ListItem() {
            BAIndexModuleView({moduleName: item})
              .margin({
                top: MARGIN_FONT_SIZE.FIRST_MARGIN
              })
          }
        }, (item: string) => JSON.stringify(item))
      }
      .listDirection(Axis.Vertical)
      .margin({
        top: MARGIN_FONT_SIZE.THIRD_MARGIN
      })
    }
    .width(ALL_PERCENT)
    .height(ALL_PERCENT)
    .backgroundColor($r('app.color.index_backgroundColor'))
  }
}