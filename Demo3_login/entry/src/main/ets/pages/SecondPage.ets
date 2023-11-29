
import router from '@ohos.router';

@Entry
@Component
struct SecondPage {
  @State message: string = 'Second Page'
  @State params: Object = router.getParams()
  // @State params: Map<string, string> = router.getParams() as Map<string, string>
  @State msg: string = this.params['msg']

  aboutToAppear() {
    console.log(`收到的 router 传参：${JSON.stringify(this.params)}`)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text(this.msg)
          .fontSize(20)
          .margin(20)

        Button('Back')
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .fontSize(30)
          .width('80%')
          .height(60)
          .margin(40)
          .onClick(() => {
            console.log("收到点击了 Back 按钮")

            // router.showAlertBeforeBackPage({
            //   message: '确定要返回吗？'
            // })

            router.replaceUrl({
              url: 'pages/Index',
              params: {
                src: 'Second页面传来的数据',
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}