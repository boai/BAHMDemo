import { BACommonConstants } from '../constants/BACommonConstants'
import getCurrentTime from '../utils/BADateUtil'
import BADataModel, { TaskItemBean }

'../viewmodel/BADataModel'

@Component
export default struct BATargetListItem {
  private taskItem?: TaskItemBean
  @State latestProgress?: number = 0
  @State updateDate?: string = ''
  @Link selectArray: Array<boolean>
  @Prop isEditModel: boolean = false
  @Link @Watch('onClickIndexChanged') clickIndex: number
  @State isExpanded: boolean = false
  @Consume overAllProgressChanged: boolean
  @State sliderMode: number = BACommonConstants.DEFAULT_SLIDER_MODE
  public index: number = 0

  aboutToAppear() {
    this.latestProgress = this.taskItem?.progressValue
    this.updateDate = this.taskItem?.updateDate
  }

  onClickIndexChanged() {
    if (this.clickIndex != this.index) {
      this.isExpanded = false
    }
  }

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Column() {
        this.targetItem()
        if (this.isExpanded) {
          Blank()

        }
      }
      .padding({
        top: $r('app.float.list_padding_top'),
        left: $r('app.float.list_padding'),
        bottom: $r('app.float.list_padding_bottom'),
        right: $r('app.float.list_padding_right')
      })
      .width(BACommonConstants.FULL_WIDTH)
      .height(this.isExpanded ? $r('app.float.expanded_item_height') : $r('app.float.list_item_height'))
      .opacity(
          this.latestProgress === BACommonConstants.SLIDER_MAX_VALUE ? BACommonConstants.OPACITY : BACommonConstants.NO_OPACITY
      )
      .borderRadius(BACommonConstants.LIST_RADIUS)
      .animation({ duration: BACommonConstants.DURATION })
      .backgroundColor(this.selectArray[this.index] ? $r('app.color.edit_blue') : Color.White)
      .onClick(() => {
        if (this.sliderMode === BACommonConstants.CLICK_SLIDER_MODE) {
          this.sliderMode = BACommonConstants.DEFAULT_SLIDER_MODE
          return
        }

        if (!this.isEditModel) {
          animateTo({ duration: BACommonConstants.DURATION }, () => {
            this.isExpanded = !this.isExpanded
          })
          this.clickIndex = this.index
        }
      })

      if (this.isEditModel) {
        Row() {
          Checkbox()
            .select(this.selectArray[this.index])
            .selectedColor($r('app.color.main_blue'))
            .width(BACommonConstants.CHECKBOX_WIDTH)
            .margin({ right: $r('app.float.list_padding') })
            .onChange((isCheck: boolean) => {
              this.selectArray[this.index] = isCheck
            })
        }
        .width(BACommonConstants.FULL_WIDTH)
        .justifyContent(FlexAlign.End)
      }
    }
    .width(BACommonConstants.FULL_WIDTH)
  }

  @Builder targetItem() {
    Row() {
      Text(this.taskItem?.taskName)
        .fontWeight(BACommonConstants.FONT_WEIGHT)
        .fontSize($r('app.float.list_font'))
        .fontColor($r('app.color.title_black_color'))
        .width(BACommonConstants.TASK_NAME_WIDTH)
        .textAlign(TextAlign.Start)
        .maxLines(BACommonConstants.MAX_LINES)

      Blank()

      Column() {
        Text(`${this.latestProgress}%`)
          .fontSize($r('app.float.list_font'))
          .fontWeight(BACommonConstants.FONT_WEIGHT)
          .fontColor($r('app.color.title_black_color'))
        Row() {
          Text($r('app.string.latest_updateTime'))
            .opacityTextStyle()
          Text(this.updateDate)
            .opacityTextStyle()
        }
        .margin({ top: $r('app.float.text_margin') })
      }
      .width(BACommonConstants.FULL_WIDTH)
    }
  }
}

@Extend(Text) function opacityTextStyle() {
  .fontSize($r('app.float.text_font'))
  .fontColor($r('app.color.title_black_color'))
  .opacity(BACommonConstants.OPACITY)
  .fontWeight(BACommonConstants.FONT_WEIGHT)
}
