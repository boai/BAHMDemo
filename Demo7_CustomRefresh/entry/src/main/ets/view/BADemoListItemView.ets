import BAConstants from '../common/constants/BAConstants'
import BADemoListItemModel from '../viewmodel/BADemoListItemModel'

@Component
export struct BADemoListItemView {
  private itemModel: BADemoListItemModel

  build() {
    Row() {
      Column() {
        Text(this.itemModel.title)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .maxLines(1)
          .textAlign(TextAlign.Start)
          .alignSelf(ItemAlign.Start)
          .textOverflow({ overflow: TextOverflow.Clip })
          .margin({ top: 10, left: 12 })

        Text(this.itemModel.content)
          .fontSize(16)
          .maxLines(2)
          .textAlign(TextAlign.Start)
          .alignSelf(ItemAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 12, left: 12, bottom: 12 })

      }
      .alignSelf(ItemAlign.Start)
      .width("60%")

      Image(this.itemModel.img)
        .width("30%")
        .alignSelf(ItemAlign.End)
        .height("80%")
        .borderRadius(12)
        .margin({ top: 12, left: 12, right: 0, bottom: 12 })
    }
    .width("92%")
    .height(100)
    .margin({ left: 12 })
    .backgroundColor(Color.White)
    .borderRadius(12)
  }
}