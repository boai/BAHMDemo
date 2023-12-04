@Entry
@Component
struct BAMainPage {
  @State updateTime: string = '2023-12-4 16:18:54'

  @Builder titleBar() {
    Column() {
      Text("工作目标")
        .fontSize(32)
        .fontWeight(FontWeight.Bolder)
        .margin(24)
        .padding({ left: 12 })
    }
    .width("100%")
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column() {

      this.titleBar()



      Column() {

        Column() {

          Row() {
            Image('')
              .width(80)
              .height(80)
              .backgroundColor(Color.Orange)
              .borderRadius(12)

            Column() {
              Text("第一季度运营目标")
                .fontWeight(FontWeight.Bold)
                .fontSize(20)
              Text("实现用户量与用户活跃度提升。")
                .fontWeight(FontWeight.Medium)
                .fontColor(0xC1C1C1)
                .fontSize(12)
                .padding({ top: 12 })
            }
            .alignItems(HorizontalAlign.Start)
            .padding({ left: 8 })
          }
          .width("100%")
          .height(120)
          // .backgroundColor(Color.Red)

          Row() {
            Column() {
              Text("整体进度")
                .fontWeight(FontWeight.Bold)
                .fontSize(18)
              Text("更新时间：" + this.updateTime)
                .fontWeight(FontWeight.Medium)
                .fontSize(12)
                .fontColor(0xC1C1C1)
                .padding({ top: 4 })
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width("100%")
          // .height(60)
          // .backgroundColor(Color.Yellow)
        }
        .width("100%")
        .height("100%")

      }
      .backgroundColor(Color.White)
      // .alignItems(HorizontalAlign.Start)
      .padding({ left: "12vp", right: "12vp" })
      .borderRadius(12)
      .width("86%")
      .height(180)

    }
    .width("100%")
    .height("100%")
    .backgroundColor(0xf1f1f1)
  }
}