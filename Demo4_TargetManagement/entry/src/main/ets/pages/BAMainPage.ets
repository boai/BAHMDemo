import { BACommonConstants } from '../constants/BACommonConstants'

import BATargetInformation from '../view/BATargetInformation'
import BADataModel, { TaskItemBean } from '../viewmodel/BADataModel'
import promptAction from '@ohos.promptAction';


@Entry
@Component
struct BAMainPage {
  @State targetData: Array<TaskItemBean> = BADataModel.getData()
  @State totalTasksNumber: number = 0
  @State completedTasksNumber: number = 0
  @State latestUpdateDate: string = BACommonConstants.DEFAULT_PROGRESS_VALUE
  // @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false;


  build() {
    Column() {

      this.titleBar()

      BATargetInformation({
        latestUpdateDate: this.latestUpdateDate,
        totalTaskNumber: this.totalTasksNumber,
        completedTasksNumber: this.completedTasksNumber
      })

    }
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