import { BACommonConstants } from '../constants/BACommonConstants'

@Component
export default struct BATargetInformation {
  @Prop latestUpdateDate: string = ''
  @Prop totalTaskNumber: number = 0
  @Prop completedTasksNumber = 0

  build() {

    Column() {
      this.targetItem()
    }
    .padding($r('app.float.target_padding'))
    .width(BACommonConstants.MAIN_BOARD_WIDTH)
    .height($r('app.float.target_info_height'))
    .backgroundColor(Color.White)
    .borderRadius(BACommonConstants.TARGET_BORDER_RADIUS)
  }

  @Builder targetItem() {
    Row() {
      Image($r('app.media.ic_main'))
        .width($r('app.float.target_image_length'))
        .height($r('app.float.target_image_length'))
        .objectFit(ImageFit.Fill)
        .borderRadius(BACommonConstants.IMAGE_BORDER_RADIUS)

      Column() {
        Text($r('app.string.target_name'))
          .fontSize($r('app.float.target_name_font'))
          .fontWeight(BACommonConstants.FONT_WEIGHT_LARGE)
          .width(BACommonConstants.TITLE_WIDTH)
        Text($r('app.string.target_info'))
          .opacityTextStyle()
          .fontSize($r('app.float.target_desc_font'))
          .margin({ top: $r('app.float.title_margin') })
      }
      .margin({ left: BACommonConstants.TARGET_MARGIN_LEFT })
      .alignItems(HorizontalAlign.Start)
    }
    .width(BACommonConstants.FULL_WIDTH)
  }

  @Builder overallProgress() {
    Row() {
      Column() {
        Text($r('app.string.overall_progress'))
          .fontWeight(BACommonConstants.FONT_WEIGHT)
          .fontSize($r('app.float.button_font'))
          .fontColor($r('app.color.title_black_color'))

        Row() {
          Text($r('app.string.latest_updateTime'))
            .opacityTextStyle()
          Text(this.latestUpdateDate)
            .opacityTextStyle()
        }
        .margin({ top: $r('app.float.text_margin') })
      }
      .alignItems(HorizontalAlign.Start)

      Blank()

      Stack() {
        Row() {
          Text(this.completedTasksNumber.toString())
            .fontSize($r('app.float.progress_font'))
            .fontWeight(BACommonConstants.FONT_WEIGHT)
            .fontColor($r('app.color.main_blue'))
          Text(`/${this.totalTaskNumber}`)
            .fontSize($r('app.float.progress_font'))
            .fontWeight(BACommonConstants.FONT_WEIGHT)
        }

        Progress({
          value: this.completedTasksNumber,
          total: this.totalTaskNumber,
          type: ProgressType.Ring
        })
          .color($r('app.color.main_blue'))
          .style({strokeWidth: BACommonConstants.STROKE_WIDTH})
          .width($r('app.float.progress_length'))
          .height($r('app.float.progress_length'))
      }
    }
    .width(BACommonConstants.FULL_WIDTH)
    .height($r('app.float.progress_length'))
    .margin({ top: $r('app.float.progress_margin_top')})
  }
}

@Extend(Text) function opacityTextStyle() {
  .fontSize($r('app.float.text_font'))
  .fontColor($r('app.color.title_black_color'))
  .opacity(BACommonConstants.OPACITY)
  .fontWeight(BACommonConstants.FONT_WEIGHT)
}