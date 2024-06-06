@Entry
@Component
struct EntryView {
  @State message: string = 'Hello World！'

  build() {
    Column() {
      example7()
    }
  }
}

@Component
struct example1 {
  @State children: Number[] = Array.from(Array<number>(900), (v, k) => k)

  /*
  使用扁平化布局优化嵌套层级
  开发者在实现自适应布局的时候，常使用Flex来达到弹性效果，这可能会造成多级嵌套。建议采用相对布局RelativeContainer进行扁平化布局，有效减少容器的嵌套层级，减少组件的创建时间。
   * */
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

  /*
   * 下述代码使用线性布局实现以上UI：
   * */
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

  /*
   * 该场景可以使用相对布局的形式来优化，具体代码实现如下：
   * */
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
          .margin({ left: 12 })
          .alignRules({
            center: { anchor: "__container__", align: VerticalAlign.Center },
            left: { anchor: "__container__", align: HorizontalAlign.Start }
          })
          .id("head")

        Text(this.name)
          .textAlign(TextAlign.Start)
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontColor(Color.Black)
          .maxLines(1)
          .padding({ left: 12 })
          .height(22)
          .alignRules({
            top: { anchor: "head", align: VerticalAlign.Top },
            left: { anchor: "head", align: HorizontalAlign.End }
          })
          .id("name")

        Text(this.timeStr)
          // .alignSelf(ItemAlign.Center)
          .textAlign(TextAlign.End)
          .fontSize(12)
          .maxLines(1)
          .height(22)
          .margin({ right: 12 })
          .alignRules({
            top: { anchor: "name", align: VerticalAlign.Top },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          })
          .id("time")

        Text(this.desc)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontSize(16)
          .width("100%")
          .margin({ top: 2 })
          .padding({ left: 12 })
          .alignRules({
            top: { anchor: "name", align: VerticalAlign.Bottom },
            left: { anchor: "head", align: HorizontalAlign.End }
          })
          .id("desc")
      }
      .width("100%")
      .height(60)
      .backgroundColor(Color.Yellow)
      .border({ width: 1, color: "# 6699FF" })
    }
    .height("50%")
  }
}

@Component
struct example4 {
  @State isVisible: Boolean = true

  build() {
    Stack() {
      Column() {
        //  下述代码中通过判断isVisible的值控制Image组件显示，这会导致在切换选择的过程中，不停创建和销毁Image组件元素。
        // if (this.isVisible) {
        //   Image($r("app.media.app_icon")).width("25%").height("12.5%").backgroundColor(Color.Yellow)
        //   Image($r("app.media.icon")).width("25%").height("12.5%").backgroundColor(Color.Green)
        //   Image($r("app.media.icon")).width("25%").height("12.5%").backgroundColor(Color.Yellow)
        //   Image($r("app.media.icon")).width("25%").height("12.5%").backgroundColor(Color.Green)
        // }

        //下面例子通过visibility属性来控制图片的显隐，避免if/else条件渲染可能带来的重排与重绘。
        Image($r("app.media.app_icon"))
          .width("25%")
          .height("12.5%")
          .backgroundColor(Color.Yellow)
          .visibility(this.isVisible ? Visibility.Visible : Visibility.None)
        Image($r("app.media.app_icon"))
          .width("25%")
          .height("12.5%")
          .backgroundColor(Color.Green)
          .visibility(this.isVisible ? Visibility.Visible : Visibility.None)
        Image($r("app.media.app_icon"))
          .width("25%")
          .height("12.5%")
          .backgroundColor(Color.Yellow)
          .visibility(this.isVisible ? Visibility.Visible : Visibility.None)
        Image($r("app.media.app_icon"))
          .width("25%")
          .height("12.5%")
          .backgroundColor(Color.Green)
          .visibility(this.isVisible ? Visibility.Visible : Visibility.None)
      }

      Column() {
        Row().width(300).height(200).backgroundColor(Color.Pink)
      }
    }
    .height("50%")
  }
}

@Component
struct example5 {
  @State message: string = 'Hello World'
  @State textWidth: string = "";

  /*布局的嵌套层次过深会导致在创建节点及进行布局时耗费更多时间。因此开发者在开发时，应避免冗余的嵌套或者使用扁平化布局来优化嵌套层次。
    反例： 使用线性布局，布局耗时166ms313us。
   * */
  build() {
    Column() {
      Image($r("app.media.app_icon")).width("100%").height(300).margin({ bottom: 20 })
      Row() {
        Blank()
        Column() {
          Image($r("app.media.app_icon")).width(40).aspectRatio(1).margin({ bottom: 4 })
          Text("Name")
        }.margin({ left: 8, right: 8 })
      }.position({ y: 280 }).width("100%")

      // Empty row
      Row().height(this.textWidth)
      Column() {
        Row() {
          Text("Singapore")
            .fontSize(20)
            .fontWeight(FontWeight.Bolder)
            .margin(8)
            .textAlign(TextAlign.Start)
        }.width("100%").justifyContent(FlexAlign.Start)

        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text("Camera").flexShrink(0).margin({ right: 8 })
          TextInput()
        }.margin(8)

        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text("Settings")
            .flexShrink(0)
            .margin({ right: 8 })
          TextInput()
        }
        .margin(8)

        Row() {
          Column() {
            Image($r("app.media.app_icon"))
              .width(80)
              .aspectRatio(1)
              .margin({ bottom: 8 })

            Text("Description")
          }
          .margin(8)
          // .layoutWeight(1)

          Column() {
            Text("Title").fontWeight(FontWeight.Bold)
              .margin({ bottom: 8 })
            Text("Long Text")
          }
          .margin(8)
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        }
        .margin(8)
        .width("100%")
        .alignItems(VerticalAlign.Top)

        Flex({ wrap: FlexWrap.Wrap }) {
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .width("90%")
        .padding(10)
        .backgroundColor(Color.Yellow)
      }
      .layoutWeight(1)

      Flex({ justifyContent: FlexAlign.End }) {
        Button("Upload").margin(8)
        Button("Discard").margin(8)
      }
    }
    .width("100%")
  }
}

@Component
struct example6 {
  @State message: string = 'Hello World'

  /*
    正例： 使用相对布局上述界面，减少了组件的嵌套深度以及组件个数，布局耗时123ms278us。
   * */
  build() {
    RelativeContainer() {
      Image($r("app.media.app_icon"))
        .width("100%")
        .height(300)
        .id("topImage")
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })

      Image($r("app.media.app_icon"))
        .width(40)
        .aspectRatio(1)
        .margin(4)
        .id("topCornerImage")
        .alignRules({
          right: { anchor: "__container__", align: HorizontalAlign.End },
          center: { anchor: "topImage", align: VerticalAlign.Bottom }
        })

      Text("Name")
        .id("name")
        .margin(4)
        .alignRules({
          left: { anchor: "topCornerImage", align: HorizontalAlign.Start },
          top: { anchor: "topCornerImage", align: VerticalAlign.Bottom }
        })

      Text("Singapore")
        .fontSize(20)
        .fontWeight(FontWeight.Bolder)
        .margin(8)
        .textAlign(TextAlign.Start)
        .id("singapore")
        .alignRules({
          top: { anchor: "name", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })

      Text("Camera")
        .margin(8)
        .height(40)
        .id("camera")
        .alignRules({
          top: { anchor: "singapore", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })

      TextInput()
        .margin(8)
        .id("cameraInput")
        .alignRules({
          top: { anchor: "singapore", align: VerticalAlign.Bottom },
          left: { anchor: "camera", align: HorizontalAlign.End },
          bottom: { anchor: "camera", align: VerticalAlign.Bottom },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        })

      Text("Settings")
        .margin(8)
        .height(40)
        .id("settings")
        .alignRules({
          top: { anchor: "camera", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })

      TextInput()
        .margin(8)
        .id("settingInput")
        .alignRules({
          top: { anchor: "camera", align: VerticalAlign.Bottom },
          left: { anchor: "settings", align: HorizontalAlign.End },
          bottom: { anchor: "settings", align: VerticalAlign.Bottom },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        })

      Image($r("app.media.app_icon"))
        .width(80)
        .aspectRatio(1)
        .margin({ bottom: 8 })
        .id("descriptionIcon")
        .alignRules({
          top: { anchor: "settings", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })

      Text("Description")
        .margin(8)
        .id("description")
        .alignRules({
          top: { anchor: "descriptionIcon", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })

      Text("Title").fontWeight(FontWeight.Bold)
        .margin(8)
        .id("title")
        .alignRules({
          top: { anchor: "descriptionIcon", align: VerticalAlign.Top },
          left: { anchor: "description", align: HorizontalAlign.End }
        })

      Text("Long Text").margin(8)
        .id("longText")
        .alignRules({
          top: { anchor: "title", align: VerticalAlign.Bottom },
          left: { anchor: "description", align: HorizontalAlign.End },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        })


      Button("Upload").margin(8)
        .id("upload")
        .alignRules({
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        })
      Button("Discard").margin(8)
        .id("discard")
        .alignRules({
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          right: { anchor: "upload", align: HorizontalAlign.Start }
        })

    }.width("100%").height("100%")
  }
}

@Observed
class DemoClassA {
  prop1: number = 0
  prop2: string = "This is Prop2"
}

@Component
struct CompA {
  @ObjectLink a: DemoClassA
  private fontSize: number = 30

  private isRenderText(): number {
    this.fontSize++
    console.log("Text prop2 is rendered")
    return this.fontSize
  }

  build() {
    Text(this.a.prop2)
      .fontSize(this.isRenderText())
  }
}

@Component
struct example7 {
  @State a: DemoClassA = new DemoClassA()

  build() {
    Row() {
      Column() {
        Text("Prop1：" + this.a.prop1)
          .fontSize(50)
          .margin({ bottom: 20 })
        CompA({ a: this.a })
        Button("Change prop1")
          .width(200)
          .margin({ top: 20 })
          .onClick(() => {
            this.a.prop1 = this.a.prop1 + 1
          })
      }
      .width("100%")
    }
    .width("100%")
    .height("100%")
  }
}



