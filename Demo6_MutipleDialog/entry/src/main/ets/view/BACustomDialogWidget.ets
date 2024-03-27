import BALogger from '../utils/BALogger'
import BAPickerUtil from '../utils/BAPickerUtil'
import BAHobbyItem from '../viewmodel/BAHobbyItem'

@CustomDialog
export default struct BACustomDialogWidget {
  @State hobbyItems: BAHobbyItem[] = []
  @Link hobbies: string
  private controller?: CustomDialogController

  aboutToAppear() {
    let context: Context = getContext(this)
    if (BAPickerUtil.isEmpty(context) || BAPickerUtil.isEmpty(context.resourceManager)) {
      BALogger.error('context or resourceManager is null', 'BACustomDialogWidget')
      return
    }
    let manger = context.resourceManager
    manger.getStringArrayValue($r('app.strarray.hobbies_data').id, (error, hobbyArray) => {
      if (!BAPickerUtil.isEmpty(error)) {
        BALogger.error('error = '+JSON.stringify(error), 'BACustomDialogWidget')
      } else {
        hobbyArray.forEach((hobby: string) => {
          let hobbyItem = new BAHobbyItem()
          hobbyItem.label = hobby
          hobbyItem.isChecked = false
          this.hobbyItems.push(hobbyItem)
        })
      }
    })
  }

  setHobbiesValue(hobbyItems: BAHobbyItem[]) {
    if (BAPickerUtil.isEmptyArray(hobbyItems)) {
      BALogger.error('hobbyItems is empty', 'BACustomDialogWidget')
      return
    }
    let hobbiesText: string = ''
    hobbiesText = hobbyItems.filter((isCheckItem: BAHobbyItem) => isCheckItem?.isChecked)
     .map<string>((checkedItem: BAHobbyItem) => {
      return checkedItem.label!
    })
      .join(', ')
    if (!BAPickerUtil.isEmpty(hobbiesText)) {
      this.hobbies = hobbiesText
    }
  }
  
  build() {
    Column() {
      Text($r('app.string.text_title_hobbies'))
        .fontColor($r('app.color.custom_color'))
        .fontSize(20)
        .lineHeight(28)
        .fontWeight(500)
        .alignSelf(ItemAlign.Start)
        .margin({
          left: 24
        })

      List() {
        ForEach(this.hobbyItems, (item: BAHobbyItem) => {
          ListItem() {
            Row() {

              Text(item.label)
                .fontSize(16)
                .fontColor($r('app.color.custom_color'))
                .layoutWeight(1)
                .textAlign(TextAlign.Start)
                .fontWeight(500)
                .margin({
                  left: 24
                })
              Toggle({ type: ToggleType.Checkbox, isOn: false })
                .onChange((isCheck) => {
                  item.isChecked = isCheck
                })
                .width(20)
                .height(20)
                .margin({
                  right: 24
                })
            }
            .height(22)
            .margin({
              top: 13,
              bottom: 13
            })
          }
        }, (item: BAHobbyItem) => JSON.stringify(item.label))
      }
      .margin({
        top: 14,
        bottom: 8
      })
      .divider({
        strokeWidth: 0.5,
        color: $r('app.color.divider_color')
      })
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.None)
      .width('100%')
      .height(242)

      Row() {
        Button($r('app.string.cancel_button'))
          .dialogButtonStyle()
          .onClick(() => {
            this.controller.close()
          })
        Blank()
          .backgroundColor('#F2F2F2')
          .width(1)
          .opacity(1)
          .height(25)
        Button($r('app.string.definite_button'))
          .dialogButtonStyle()
          .onClick(() => {
            this.setHobbiesValue(this.hobbyItems)
            this.controller.close()
          })
      }
    }
    .width('93%')
    .padding({
      top: 14,
      bottom: 16
    })
    .borderRadius(32)
    .backgroundColor(Color.White)
  }
}

@Extend(Button) function dialogButtonStyle() {
  .fontSize(16)
  .fontColor('#007DFF')
  .layoutWeight(1)
  .backgroundColor(Color.White)
  .width('100%')
  .height(40)
}