
import CommonConstant from '../common//constant/CommonConstant'

export class BADataModel {

  private tasks: Array<string> = CommonConstant.TODO_DATA

  getData(): Array<string> {
    return this.tasks
  }
}

export default new BADataModel()