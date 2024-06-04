import BAConstants, { MARGIN_FONT_SIZE } from '../common/constants/BAConstants'
import { BADemoListItemVerticalView } from '../view/BADemoListItemVerticalView'
import { BADemoListItemView } from '../view/BADemoListItemView'
import { BASwiperView } from '../view/BASwiperView'
import BADemoListItemModel from '../viewmodel/BADemoListItemModel'

@Preview
@Component
export default struct BADemoListIndex {
  build() {
    Scroll() {
      Column() {
        Column() {
          Text("快速入门")
            .fontColor(Color.Black)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Start)
            .margin({ top: 24, left: 12 })
            .alignSelf(ItemAlign.Start)

          BASwiperView()
        }

        Column() {

          Row() {
            Text("赋能套件")
              .fontColor(Color.Black)
              .fontSize(20)
              .fontWeight(FontWeight.Medium)
              .textAlign(TextAlign.Start)
              .margin({ left: 12 })
              .alignSelf(ItemAlign.Start)
              .height(40)

            Button("更多 >", { type: ButtonType.Normal })
              .backgroundColor(Color.Transparent)
              .fontColor(Color.Black)
              .align(Alignment.End)
              .margin({ right: 12 })
              .height(40)
          }
          .alignItems(VerticalAlign.Center)
          .width("100%")
          .height(40)
          // .backgroundColor(Color.Yellow)
          .justifyContent(FlexAlign.SpaceBetween)

          List({ space: 10 }) {
            ForEach(BAConstants.tutorialSampleList, (item: BADemoListItemModel) => {
              ListItem() {
                BADemoListItemVerticalView({ itemModel: item })
              }
            }, (item: BADemoListItemModel) => JSON.stringify(item))
          }
          .listDirection(Axis.Horizontal)
          .alignListItem(ListItemAlign.Start)
          .width("94%")
          .height(180)
          // .backgroundColor(Color.Orange)
        }

        Column({space: 10}) {
          Text("入门教程")
            .fontColor(Color.Black)
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .textAlign(TextAlign.Start)
            .margin({ left: 12 })
            .alignSelf(ItemAlign.Start)

          List({ space: 10 }) {
            ForEach(BAConstants.tutorialSampleList, (item: BADemoListItemModel) => {
              ListItem() {
                BADemoListItemView({ itemModel: item })
              }
            }, (item: BADemoListItemModel) => JSON.stringify(item))
          }
          .listDirection(Axis.Vertical)
          .align(Alignment.TopStart)
        }
        .margin({top: 10})
      }
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBarColor(Color.Orange)
    .scrollBar(BarState.Auto)
    .scrollBarWidth(10)
    .edgeEffect(EdgeEffect.Spring)
    .width(BAConstants.Full_Length)
    .height(BAConstants.Full_Length)
    .backgroundColor("#EEEEEE")
  }
}