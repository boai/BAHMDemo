import { BACommonConstants } from '../constants/BACommonConstants'

import BATargetInformation from '../view/BATargetInformation'
import BADataModel, { TaskItemBean } from '../viewmodel/BADataModel'
import promptAction from '@ohos.promptAction';
import getCurrentTime from '../utils/BADateUtil'
import BATargetList from '../view/BATargetList'
import BAAddTargetDialog from '../view/BAAddTargetDialog'
import data from '@ohos.telephony.data';

@Entry
@Component
struct BAMainPage {
  @State targetData: Array<TaskItemBean> = BADataModel.getData()
  @State totalTasksNumber: number = 0
  @State completedTasksNumber: number = 0
  @State latestUpdateDate: string = BACommonConstants.DEFAULT_PROGRESS_VALUE
  @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false;

  dialogController: CustomDialogController = new CustomDialogController({
    builder: BAAddTargetDialog({
      onClickOk: (value: string): void => this.saveTask(value)
    }),
    alignment: DialogAlignment.Bottom,
    offset: {
      dx: BACommonConstants.DIALOG_OFFSET_X,
      dy: $r('app.float.dialog_offset_y')
    },
    customStyle: true,
    autoCancel: false
  });

  onProgressChanged() {
    this.totalTasksNumber = this.targetData.length
    this.completedTasksNumber = this.targetData.filter((item: TaskItemBean) => {
      return item.progressValue === BACommonConstants.SLIDER_MAX_VALUE
    }).length
    this.latestUpdateDate = getCurrentTime()
  }

  build() {
    Column() {
      this.titleBar()
      BATargetInformation({
        latestUpdateDate: this.latestUpdateDate,
        totalTasksNumber: this.totalTasksNumber,
        completedTasksNumber: this.completedTasksNumber
      })
      BATargetList({
        targetData: $targetData,
        onAddClick: (): void => this.dialogController.open()
      })
        .height(BACommonConstants.LIST_BOARD_HEIGHT)
    }
    .width(BACommonConstants.FULL_WIDTH)
    .height(BACommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.index_background'))
  }

  @Builder titleBar() {
    Column() {
      Text($r('app.string.title'))
        .width(BACommonConstants.TITLE_WIDTH)
        .height($r('app.float.title_height'))
        .fontSize($r('app.float.title_font'))
        .fontWeight(BACommonConstants.FONT_WEIGHT_LARGE)
        .textAlign(TextAlign.Start)
        .margin({ top: $r('app.float.title_margin'), bottom: $r('app.float.title_margin') })
    }
  }

  saveTask(taskName: string) {
    if (taskName == '') {
      promptAction.showToast({
        message: $r('app.string.cannot_input_empty'),
        duration: BACommonConstants.TOAST_TIME,
        bottom: BACommonConstants.TOAST_MARGIN_BOTTOM
      })
      return
    }
    BADataModel.addData(new TaskItemBean(taskName, getCurrentTime(), 0));
    this.targetData = BADataModel.getData()
    this.overAllProgressChanged = !this.overAllProgressChanged
    this.dialogController.close()
  }

}