import BAConstants from '../common/constants/BAConstants'
import BADemoListItemModel from '../viewmodel/BADemoListItemModel'

@Component
export struct BADemoListItemVerticalView {
  private itemModel: BADemoListItemModel

  build() {
    Column() {
      Image(this.itemModel.img)
        .width("100%")
        .height("50%")
        .borderRadius( { topLeft: 12, topRight: 12 } )

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
    .width("50%")
    // .margin({ left: 12, right: 12 })
    .backgroundColor(Color.White)
    .borderRadius(12)
  }
}