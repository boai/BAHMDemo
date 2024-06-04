
import { STRING_PERCENT, MARGIN_FONT_SIZE, SECOND_PAGE, SWIPER_Imgs } from '../common/constants/BAConstants'
import BALogger from '../common/utils/BALogger'
// import { SWIPER_VIDEOS } from '../viewmodel/VideoData'
import { SwiperVideoItem } from '../viewmodel/SwiperVideoItem'
// import { ParamItem } from '../viewmodel/ParamItem'


@Component
export struct BASwiperView {
  build() {
    Column() {
      Swiper() {
        ForEach(SWIPER_Imgs, (item: SwiperVideoItem) => {
          SwiperItem({
            imageSrc: item.image
          })
            .onClick(()=> {
              BALogger.info('点击了广告！', 'BASwiperView')
            })
        }, (item: SwiperVideoItem) => JSON.stringify(item))
      }
      .autoPlay(true)
      .indicatorStyle({
        bottom: 44
      })
    }
    .borderRadius(MARGIN_FONT_SIZE.FIRST_MARGIN)
    .height(STRING_PERCENT.INDEX_SWIPER_HEIGHT_PERCENT)
    .width("96%")
    .backgroundColor(Color.Transparent)
    // .margin({
    //   left: MARGIN_FONT_SIZE.FIRST_MARGIN,
    //   right: MARGIN_FONT_SIZE.FIRST_MARGIN,
    //   top: MARGIN_FONT_SIZE.FIRST_MARGIN,
    // })
  }
}

@Component
struct SwiperItem {
  private imageSrc: Resource = $r('app.string.empty')
  // private source: Resource = $r('app.string.empty')
  // private paramItem: ParamItem = new ParamItem()

  aboutToAppear() {
    // this.paramItem.source = this.source
  }

  build() {
    // Navigator({ target: SECOND_PAGE, type: NavigationType.Push }) {
      Image(this.imageSrc)
        .objectFit(ImageFit.Contain)
        .margin(12)
        .borderRadius(MARGIN_FONT_SIZE.FIRST_MARGIN)
        // .margin({
        //
        // })

    // }
    // .params(this.paramItem)
  }
}