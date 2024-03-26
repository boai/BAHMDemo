import BAHobbyItem from '../viewmodel/BAHobbyItem'

@CustomDialog
export default struct BACustomDialogWidget {
  @State hobbyItems: BAHobbyItem[] = []
  @Link hobbies: string
  private controller?: CustomDialogController

  build() {
    Column() {
      Text('')
    }
  }
}