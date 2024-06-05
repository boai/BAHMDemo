@Entry
@Component
struct EntryView {
  @State message: string = 'Hello World！'

  build() {
    Column() {
      example3()
    }
  }
}

@Component
struct example1 {
  @State children: Number[] = Array.from(Array<number>(900), (v, k) => k)

  build() {
    Scroll() {
      Grid() {
        ForEach(this.children, (item: Number[]) => {
          GridItem() {
            Text(item.toString())
          }
          .backgroundColor(Color.Pink)
        }, (item: string) => item)
      }
      .columnsTemplate("1fr 1fr 1fr 1fr")
      .columnsGap(0)
      .rowsGap(0)
      .width("100%")
      .height("100%")
    }
  }
}

@Component
struct example2 {
  @State name: string = "张三"
  @State desc: string = "从事鸿蒙开发多年"
  @State timeStr: string = "2分钟前"

  build() {
    Row() {
      Column() {
        Text(this.name.charAt(0))
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .fontWeight(FontWeight.Bold)
          .fontSize(24)
          .width("100%")
          .height("100%")
      }
      .margin({ left: 12 })
      .width(40)
      .height(40)
      .backgroundColor(Color.Orange)
      .borderRadius(20)

      Column() {
        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text(this.name)
            .textAlign(TextAlign.Start)
            .fontSize(20)
            .fontWeight(FontWeight.Medium)

          Text(this.timeStr)
            // .alignSelf(ItemAlign.Center)
            .textAlign(TextAlign.End)
            .fontSize(12)
        }
        .width("80%")

        Text(this.desc)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 10 })
    }
    .backgroundColor(Color.Yellow)
    .margin({ top: 120 })
    .width("100%")
    .height(60)
  }
}

@Component
struct example3 {
  @State name: string = "张三"
  @State desc: string = "从事鸿蒙开发多年"
  @State timeStr: string = "2分钟前"

  build() {
    Row() {
      RelativeContainer() {
        Text(this.name.charAt(0))
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .fontWeight(FontWeight.Bold)
          .fontSize(24)
          .width(40)
          .height(40)
          .clip(new Circle({ width: 40, height: 40 }))
          .backgroundColor(Color.Green)
          .margin({left:12})
          .alignRules({
            center: { anchor: "__container__", align: VerticalAlign.Center },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })
          .id("head")

        Text(this.name)
          .textAlign(TextAlign.Start)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .fontColor(Color.Black)
          .maxLines(1)
          .padding({left: 12})
          .height(22)
          .alignRules({
            top: {anchor: "head", align: VerticalAlign.Top},
            left: {anchor: "head", align: HorizontalAlign.End}
          })
          .id("name")

        Text(this.timeStr)
          // .alignSelf(ItemAlign.Center)
          .textAlign(TextAlign.End)
          .fontSize(12)
          .maxLines(1)
          .height(22)
          .margin({right: 12})
          .alignRules({
            top: {anchor: "name", align: VerticalAlign.Top},
            right: {anchor: "__container__", align: HorizontalAlign.End}
          })
          .id("time")

        Text(this.desc)
          .maxLines(1)
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .fontSize(16)
          .width("100%")
          .margin({top: 2})
          .padding({left: 12})
          .alignRules({
            top: {anchor: "name", align: VerticalAlign.Bottom},
            left: {anchor: "head", align: HorizontalAlign.End}
          })
          .id("desc")
      }
      .width("100%")
      .height(60)
      .backgroundColor(Color.Yellow)
      .border({width:1, color: "# 6699FF"})
    }
    .height("50%")
  }
}