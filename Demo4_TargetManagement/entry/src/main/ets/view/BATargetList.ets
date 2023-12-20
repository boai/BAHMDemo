import { BACommonConstants } from '../constants/BACommonConstants'
import BATargetListItem from './BATargetListItem'
import BADataModel, { TaskItemBean } from '../viewmodel/BADataModel'

@Component
export default struct BATargetList {
  @Consume overAllProgressChanged: boolean
  @State isEditMode: boolean = false
  @State clickIndex: number = BACommonConstants.DEFAULT_CLICK_INDEX
  @State selectArray: Array<boolean> = []
  @State selectAll: boolean = false
  @Link targetData: Array<TaskItemBean>
  onAddClick?: () => void

  build() {
    Column() {
      Row() {
        Text($r('app.string.sub_goals'))
          .fontSize($r('app.float.secondary_title'))
          .fontWeight(BACommonConstants.FONT_WEIGHT_LARGE)
          .fontColor($r('app.color.title_black_color'))
        Blank()
        if (this.targetData.length > 0) {
          if (this.isEditMode) {
            Text($r('app.string.cancel_button'))
              .operateTextStyle($r('app.color.main_blue'))
              .margin({ left: $r('app.float.operate_button_margin') })
              .onClick(() => {
                this.selectAll = false;
                this.isEditMode = false;
                this.selectAllOrCancel(false);
              })
            Text($r('app.string.select_all_button'))
              .operateTextStyle($r('app.color.main_blue'))
              .margin({
                left: $r('app.float.operate_button_margin')
              })
            Checkbox()
              .select(this.isSelectAll())
              .selectedColor($r('app.color.main_blue'))
              .width(BACommonConstants.CHECKBOX_WIDTH)
              .onClick(() => {
                this.selectAll = !this.selectAll;
                this.selectAllOrCancel(this.selectAll);
              })
          } else {
            Text($r('app.string.edit_button'))
              .operateTextStyle($r('app.color.main_blue'))
              .onClick(() => {
                this.isEditMode = true;
                this.selectAllOrCancel(false);
              })
          }
        }
      }
      .width(BACommonConstants.FULL_WIDTH)
      .height($r('app.float.history_line_height'))
      .padding({
        left: $r('app.float.list_padding'),
        right: $r('app.float.list_padding_right')
      })

      List({ space: BACommonConstants.LIST_SPACE }) {
        ForEach(this.targetData, (item: TaskItemBean, index: number | undefined) => {
          ListItem() {
            BATargetListItem({
              taskItem: item,
              index: index,
              selectArray: $selectArray,
              isEditModel: this.isEditMode,
              clickIndex: $clickIndex
            })
          }
        }, (item: TaskItemBean) => JSON.stringify(item))
      }
      .edgeEffect(EdgeEffect.None)
      .margin({top: 12})
      .width(BACommonConstants.FULL_WIDTH)
      .height(BACommonConstants.LIST_HEIGHT)

      Blank()
      if (this.isEditMode) {
        Button($r('app.string.delete_button'))
          .opacity(this.isSelectRows() ? BACommonConstants.NO_OPACITY : BACommonConstants.OPACITY)
          .enabled(this.isSelectRows() ? true : false)
          .operateButtonStyle($r('app.color.main_red'))
          .onClick(() => {
            this.deleteSelected();
            this.selectAllOrCancel(false);
            this.selectAll = false;
          })
      } else {
        Button($r('app.string.add_task'))
          .operateButtonStyle($r('app.color.main_blue'))
          .onClick(() => {
            if (this.onAddClick !== undefined) {
              this.onAddClick()
            }
          })
      }
    }
    .width(BACommonConstants.MAIN_BOARD_WIDTH)
    .height(BACommonConstants.FULL_HEIGHT)
    .padding({ top: 16 })
  }

  deleteSelected() {
    BADataModel.deleteData(this.selectArray)
    this.targetData = BADataModel.getData()
    this.overAllProgressChanged = !this.overAllProgressChanged
    this.isEditMode = false
  }

  selectAllOrCancel(selectStatus: boolean) {
    let newSelectArray: Array<boolean> = []
    this.targetData.forEach(() => {
      newSelectArray.push(selectStatus)
    })
    this.selectArray = newSelectArray
  }

  isSelectAll(): boolean {
    if (this.selectArray.length == 0) {
      return false
    }
    let deSelectCount: Length = this.selectArray.filter((selected: boolean) => selected == false).length
    if (deSelectCount == 0) {
      this.selectAll = true
      return true
    }
    this.selectAll = false
    return false
  }

  isSelectRows(): boolean {
    return this.selectArray.filter((selected: boolean) => selected == true).length != 0
  }
}

@Extend(Text) function operateTextStyle(color: Resource) {
  .fontSize($r('app.float.text_button_font'))
  .fontColor(color)
  .lineHeight($r('app.float.text_line_height'))
  .fontWeight(BACommonConstants.FONT_WEIGHT)
}

@Extend(Button) function operateButtonStyle(color: Resource) {
  .width($r('app.float.button_width'))
  .height($r('app.float.button_height'))
  .fontSize($r('app.float.button_font'))
  .fontWeight(BACommonConstants.FONT_WEIGHT)
  .fontColor(color)
  .backgroundColor($r('app.color.button_background'))
}







