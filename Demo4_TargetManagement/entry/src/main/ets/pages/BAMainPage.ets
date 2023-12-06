import { BACommonConstants } from '../constants/BACommonConstants'

import BATargetInformation from '../view/BATargetInformation'
import BADataModel, { TaskItemBean } from '../viewmodel/BADataModel'
import promptAction from '@ohos.promptAction';
import getCurrentTime from '../utils/BADateUtil';


@Entry
@Component
struct BAMainPage {
  @State targetData: Array<TaskItemBean> = BADataModel.getData()
  @State totalTasksNumber: number = 0
  @State completedTasksNumber: number = 0
  @State latestUpdateDate: string = BACommonConstants.DEFAULT_PROGRESS_VALUE
  @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false;

  onProgressChanged() {
    this.totalTasksNumber = this.targetData.length
    this.completedTasksNumber = this.targetData.filter((item: TaskItemBean) => {
      return item.progressValue == BACommonConstants.SLIDER_MAX_VALUE
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
}