import BATextInputWidget from '../view/BATextInputWidget'
import BATextSelectWidget from '../view/BATextSelectWidget'
import BALogger from '../../../../../../Demo7_CustomRefresh/entry/src/main/ets/common/utils/BALogger'
import BACustomDialogWidget from '../view/BACustomDialogWidget'
import BAPickerUtil from '../utils/BAPickerUtil'
import Context from '@ohos.app.ability.common'

@Entry
@Component
struct BAMinePage {
  @State message: string = 'Hello World'
  @State birthdate: string = ''
  @State sex: string = ''
  @State sexIndex: number = 0
  @State hobbies: string = ''
  private sexArray: Resource = $r('app.strarray.sex_array')
  customDialogController: CustomDialogController = new CustomDialogController({
    builder: BACustomDialogWidget({
      hobbies: $hobbies
    }),
    alignment: DialogAlignment.Bottom,
    customStyle: true,
    offset: {
      dx: 0,
      dy: -20
    }
  });

  aboutToAppear() {
    let date = new Date()
    let year = date.getFullYear()
    let month = date.getMonth() + 1
    let day = date.getDate()
    this.birthdate = BAPickerUtil.getBirthDate(year, month, day)

    let context = getContext(this)
    if (BAPickerUtil.isEmpty(context) || BAPickerUtil.isEmpty(context.resourceManager)) {
      BALogger.error('context or resourceManager is null', 'BAMinePage')
      return
    }
    let manager = context.resourceManager
    manager.getStringValue($r('app.string.default_sex').id, (error, sexValue) => {
      if (!BAPickerUtil.isEmpty(error)) {
        BALogger.error('error = ' + JSON.stringify(error), 'BAMinePage')
      } else {
        this.sex = sexValue
      }
    })
  }

  build() {
    Column() {

      Image($r('app.media.ic_back'))
        .width(26)
        .height(26)
        .alignSelf(ItemAlign.Start)
        .margin({
          left: 16,
          top: 16
        })
        .padding({
          left: 16
        })
        .onClick(() => {
          let context = getContext(this) as Context.UIAbilityContext
          BAPickerUtil.AlertDialog(context)
        })

      Column() {
        Image($r('app.media.ic_avatar'))
          .width(56)
          .height(56)

        Text("个人信息")
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .margin({
            top: 12
          })

      }
      .alignSelf(ItemAlign.Center)

      Column() {
        BATextInputWidget({
          inputImage: $r('app.media.ic_nickname'),
          hintText: $r('app.string.text_input_hint')
        })

        BATextSelectWidget({
          textImage: $r('app.media.ic_birthdate'),
          title: $r('app.string.title_birthdate'),
          content: $birthdate,
          onItemClick: () => {
            BALogger.info("点击了生日！")
            BAPickerUtil.datePickerDialog((result: string) => {
              this.birthdate = result
            })
          }
        })

        BATextSelectWidget({
          textImage: $r('app.media.ic_sex'),
          title: $r('app.string.title_sex'),
          content: $sex,
          onItemClick: () => {
            BALogger.info('点击了性别')
            BAPickerUtil.textPickerDialog(this.sexArray, this.sexIndex, (result: TextPickerResult) => {
              this.sex = result.value
              this.sexIndex = result.index
            })
          }
        })

        BATextInputWidget({
          inputImage: $r('app.media.ic_signature'),
          hintText: $r('app.string.text_input_signature')
        })

        BATextSelectWidget({
          textImage: $r('app.media.ic_hobbies'),
          title: $r('app.string.title_hobbies'),
          content: $hobbies,
          onItemClick: () => {
            BALogger.info('点击了兴趣')
            this.customDialogController.open()
          }
        })
      }
    }
    .backgroundColor($r('app.color.column_background_color'))
    .width('100%')
    .height('100%')
  }
}