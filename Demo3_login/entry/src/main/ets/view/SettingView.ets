import CommonConstats from '../common/CommonConstats'
import HomeViewModel from '../viewmodel/HomeViewModel'
import ItemData from '../viewmodel/ItemData'

@Component
export default struct SettingView {
  build() {
    Scroll() {
      Column({ space: CommonConstats.COMMON_SPACE }) {
        Column() {
          Text($r('app.string.mainPage_tabTitles_mine'))
            .fontColor($r('app.color.title_text_color'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({ top: $r('app.float.mainPage_tabTitles_margin') })
            .padding({ left: $r('app.float.mainPage_tabTitles_padding') })
        }
        .width(CommonConstats.FULL_PARENT)
        .alignItems(HorizontalAlign.Start)

        Row() {
          Image($r('app.media.account'))
            .width($r('app.float.setting_account_size'))
            .height($r('app.float.setting_account_size'))

          Column() {
            Text($r('app.string.setting_account_name'))
              .fontSize($r('app.float.setting_account_fontSize'))
            // .height($r('app.float.setting_account_text_height'))
            Text($r('app.string.setting_account_email'))
              .fontSize($r('app.float.little_text_size'))
              .margin($r('app.float.setting_name_margin'))
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: $r('app.float.setting_account_margin') })
        }
        .margin($r('app.float.setting_account_margin'))
        .alignItems(VerticalAlign.Center)
        .width(CommonConstats.FULL_PARENT)
        .height($r('app.float.setting_account_height'))
        .backgroundColor(Color.White)
        .padding({ left: $r('app.float.setting_account_padding') })
        .borderRadius($r('app.float.setting_account_borderRadius'))

        List() {
          ForEach(HomeViewModel.getSettingListData(), (item: ItemData) => {
            ListItem() {
              this.settingCell(item)
            }
            .height($r('app.float.setting_list_height'))
          }, (item: ItemData) => JSON.stringify(item))
        }
        .backgroundColor(Color.White)
        .width(CommonConstats.FULL_PARENT)
        .height(CommonConstats.SET_LIST_WIDTH)
        .divider({
          strokeWidth: $r('app.float.setting_list_strokeWidth'),
          color: Color.Grey,
          startMargin: $r('app.float.setting_list_startMargin'),
          endMargin: $r('app.float.setting_list_endMargin')
        })
        .borderRadius($r('app.float.setting_list_borderRadius'))
        .padding({ top: $r('app.float.setting_list_padding'), bottom: $r('app.float.setting_list_padding') })

        Blank()

        Button($r('app.string.setting_button'), { type:ButtonType.Capsule })
          .width(CommonConstats.BUTTON_WIDTH)
          .height($r('app.float.login_button_height'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.setting_button_fontColor'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.setting_button_backgroundColor'))
          .margin({ bottom: $r('app.float.setting_button_bottom') })
      }
      .height(CommonConstats.FULL_PARENT)
    }
  }

  @Builder settingCell(item: ItemData) {
    Row() {

      Row({ space: CommonConstats.COMMON_SPACE }) {
        Image(item.img)
          .width($r('app.float.setting_size'))
          .height($r('app.float.setting_size'))

        Text(item.title)
          .fontSize($r('app.float.normal_text_size'))
      }

      if (item.others === null) {
        Image($r('app.media.right_grey'))
          .width($r('app.float.setting_jump_width'))
          .height($r('app.float.setting_jump_height'))
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstats.FULL_PARENT)
    .padding({
      left: $r('app.float.setting_settingCell_left'),
      right: $r('app.float.setting_settingCell_right')
    })

  }
}