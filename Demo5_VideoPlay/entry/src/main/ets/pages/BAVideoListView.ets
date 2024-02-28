
import { LIST, MARGIN_FONT_SIZE, ALL_PERCENT} from '../common/constants/BACommonConstants'
import { BASwiperView } from '../view/BASwiperView'

@Entry
@Component
struct BAVideoListView {

  build() {

    Column({ space: MARGIN_FONT_SIZE.FOURTH_MARGIN }) {
        BASwiperView()
    }
    .width(ALL_PERCENT)
    .height(ALL_PERCENT)
    .backgroundColor($r('app.color.index_backgroundColor'))
  }
}