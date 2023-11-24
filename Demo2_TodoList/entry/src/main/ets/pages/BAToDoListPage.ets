
import CommonConstant from '../common/constant/CommonConstant'
import BADataModel from '../viewmodel/BADataModel'
import BAToDoItem from '../view/BAToDoItem'

@Entry
@Component
struct BAToDoListPage {
  private totalTasks: Array<string> = [];

  aboutToAppear() {
    this.totalTasks = BADataModel.getData();
  }

  build() {
    Column({ space: CommonConstant.COLUMN_SPACE }) {
      Text($r('app.string.page_title'))
        .fontSize($r('app.float.title_font_size'))
        .fontWeight(FontWeight.Bold)
        .lineHeight($r('app.float.title_font_height'))
        .width(CommonConstant.TITLE_WIDTH)
        .margin({
          top: $r('app.float.title_margin_top'),
          bottom: $r('app.float.title_margin_bottom')
        })
        .textAlign(TextAlign.Start)

      ForEach(this.totalTasks, (item: string) => {
        BAToDoItem({ content: item })
      }, (item: string) => JSON.stringify(item))
    }
    .width(CommonConstant.FULL_LENGTH)
    .height(CommonConstant.FULL_LENGTH)
    .backgroundColor($r('app.color.page_background'))
  }
}






