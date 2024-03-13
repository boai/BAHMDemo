
import {
  ALL_PERCENT,
  MARGIN_FONT_SIZE,
  COMMON_NUM_FONT_WEIGHT,
  STACK_STYLE,
} from '../common/constants/BACommonConstants'
import { BAVideoPlayer } from '../view/BAVideoPlayer'
import router from '@ohos.router'

@Entry
@Component
export struct BAVideoPlayView {

  private source: string = (router.getParams() as Record<string, Object>).source as  string
  controller: VideoController = new VideoController()

  private startIconResource: Resource = $r('app.media.ic_public_play')
  private backIconResource: Resource = $r('app.media.ic_back')

  @Provide isPlay: boolean = false
  @Provide isOpacity: boolean = false
  @Provide isLoading: boolean = false
  @Provide progressVal: number = 0
  @Provide flag: boolean = false

  aboutToAppear() {
    this.source
  }

  onPageHide() {
    this.controller.pause();
  }

  build() {

    Column() {
      Row() {
        Image(this.backIconResource)
          .width(MARGIN_FONT_SIZE.FOURTH_MARGIN)
          .height(MARGIN_FONT_SIZE.FOURTH_MARGIN)
          .margin({
            left: MARGIN_FONT_SIZE.FOURTH_MARGIN
          })
          .onClick(()=> {
            router.back()
          })
        Text($r('app.string.back'))
          .fontColor(Color.White)
          .fontSize(MARGIN_FONT_SIZE.FOURTH_MARGIN)
          .fontWeight(COMMON_NUM_FONT_WEIGHT)
          .margin({
            left: MARGIN_FONT_SIZE.FIRST_MARGIN
          })
      }
      .width(ALL_PERCENT)
      .margin({
        left: MARGIN_FONT_SIZE.FIRST_MARGIN,
        top: MARGIN_FONT_SIZE.FIRST_MARGIN
      })
      .justifyContent(FlexAlign.Start)

      Stack() {
        if (!this.isPlay && !this.isLoading) {
          Image(this.startIconResource)
            .width(MARGIN_FONT_SIZE.FIFTH_MARGIN)
            .height(MARGIN_FONT_SIZE.FIFTH_MARGIN)
            .zIndex(STACK_STYLE.IMAGE_Z_INDEX)
        }
        if (this.isLoading) {
          Progress({
            value: STACK_STYLE.PROGRESS_VALUE,
            total: STACK_STYLE.PROGRESS_TOTAL,
            type: ProgressType.ScaleRing
          })
            .color(Color.Gray)
            .value(this.progressVal)
            .width(STACK_STYLE.PROGRESS_WIDTH)
            .style({
              strokeWidth: STACK_STYLE.PROGRESS_STROKE_WIDTH,
              scaleCount: STACK_STYLE.PROGRESS_SCALE_COUNT,
              scaleWidth: STACK_STYLE.PROGRESS_SCALE_WIDTH
            })
            .zIndex(STACK_STYLE.PROGRESS_Z_INDEX)
        }
        BAVideoPlayer({
          source: this.source,
          controller: this.controller
        })
          .zIndex(0)
      }
    }
    .height(ALL_PERCENT)
    .backgroundColor(Color.Black)
  }
}