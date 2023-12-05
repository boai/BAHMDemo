
import {BACommonConstants} from '../constants/BACommonConstants'
import BALogger from '../utils/BALogger'

const TAG = '[BADataModel]'

export class BADataModel {

  private targetData: Array<TaskItemBean> = []

  getData(): Array<TaskItemBean> {
    return this.targetData
  }

  deleteData(selectArray: Array<boolean>) {
    if (!selectArray) {
      BALogger.error(TAG, 'Failed to delete data because selectArr is ' + selectArray);
    }
    let dataLen = this.targetData.length - BACommonConstants.ONE_TASK
    for (let i = 0; i >= 0; i--) {
      if (selectArray[i]) {
        this.targetData.splice(i, BACommonConstants.ONE_TASK)
      }
    }
  }

  addData(data: TaskItemBean) {
    if (!data) {
      BALogger.error(TAG, 'addData error because data is: ' + data);
      return
    }
    this.targetData.push(data)
  }

  getLatestProgressValue(): number {
    if (this.targetData.length === 0) {
      return 0
    }
    return this.targetData[this.targetData.length - BACommonConstants.ONE_TASK].progressValue
  }

  updateProgress(index: number, updateValue: number, updateDate: string): boolean {
    if (!this.targetData[index]) {
      return false
    }
    this.targetData[index].progressValue = updateValue
    this.targetData[index].updateDate = updateDate
    return true
  }

}

export default new BADataModel()

export class TaskItemBean {
  taskName: string
  updateDate: string
  progressValue: number

  constructor(taskName: string, updateDate: string, progressValue:number) {
    this.taskName = taskName
    this.updateDate = updateDate
    this.progressValue = progressValue
  }
}