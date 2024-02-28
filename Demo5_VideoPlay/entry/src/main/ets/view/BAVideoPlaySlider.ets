
import {
  ALL_PERCENT,
  MARGIN_FONT_SIZE,
  SMALL_TRACK_THICK_NESS,
  DEFAULT_OPACITY,
  STRING_PERCENT,
  BIG_TRACK_THICK_NESS,
  IMAGE_SIZE,
  STACK_STYLE
} from '../common/constants/BACommonConstants'

@Component
export struct BAVideoPlaySlider {

  private controller: VideoController = new VideoController()
  @Consume isPlay: boolean

  build() {
      Row({ space: MARGIN_FONT_SIZE.FIRST_MARGIN }) {
        Image(this.isPlay ? $r('app.media.ic_pause'):$r('app.media.ic_play'))
          .width(IMAGE_SIZE)
          .height(IMAGE_SIZE)
          // .margin({})
      }
    .opacity(DEFAULT_OPACITY)
    .width(ALL_PERCENT)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }

}