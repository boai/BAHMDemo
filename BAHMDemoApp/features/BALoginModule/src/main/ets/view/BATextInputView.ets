import { BACommonConstants } from '@ohos/bacommon/src/main/ets/constants/BACommonConstants'

@Component
export struct BATextInputView {
  @Prop placeholder?: string = ''
  @Prop text?: string = ''
  @Prop type?: InputType = InputType.Normal
  onChange?: (value: string) => void

  build() {
    Column() {
      TextInput({ placeholder: this.placeholder, text: this.text })
        .type(this.type)
        .placeholderColor("#D8D8D8")
        .backgroundColor(Color.Transparent)
        .onChange(this.onChange)

      Divider()
        .color("#D8D8D8")
        .width("88%")
        .height(0.5)
    }
    .width(BACommonConstants.PERSENT_FULL)
    .height(BACommonConstants.PERSENT_FULL)
  }
}