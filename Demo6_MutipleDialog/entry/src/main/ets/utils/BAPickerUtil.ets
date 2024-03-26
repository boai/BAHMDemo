
import Context from '@ohos.app.ability.common'
import BALogger from './BALogger'

export class BAPickerUtil {

  AlertDialog(context: Context.UIAbilityContext) {
    AlertDialog.show({
      message: $r('app.string.alert_dialog_message'),
      alignment: DialogAlignment.Bottom,
      offset: {
        dx: 0,
        dy: -20
      },
      primaryButton: {
        value: $r('app.string.cancel_button'),
        action: () => {
          BALogger.info('点击了取消按钮', 'BAPickerUtil')
        }
      },
      secondaryButton: {
        value: $r('app.string.definite_button'),
        action: () => {
          BALogger.info('点击了确定按钮', 'BAPickerUtil')
        }
      }
    })
  }

  datePickerDialog(dataCallBack: Function) {
    DatePickerDialog.show({
      start: new Date('1900-1-1'),
      end: new Date,
      selected: new Date('1990-1-1'),
      lunar: false,
      onAccept: (value: DatePickerResult) => {
        BALogger.info('弹出日期选择器', 'BAPickerUtil')

        let year: number = Number(value.year)
        let month: number = Number(value.month)
        let day: number = Number(value.day)
        let birthDate: string = this.getBirthDate(year, month, day)
        dataCallBack(birthDate);
      }
    });
  }



  getBirthDate(year: number, month: number, day: number): string {
    let birthDate: string = `${year}${'年'}` + `${month}${`月`}` + `${day}${'日'}`
    return birthDate
  }


}

export default new BAPickerUtil();