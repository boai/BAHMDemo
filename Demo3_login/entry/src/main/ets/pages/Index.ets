import router from '@ohos.router'
import App from '@system.app';
import BALogger from '../utils/BALogger'


const TAG = '[IndexPage]';


@Entry
@Component
struct Index {
  @State tip: string = 'HarmonyOS'
  @State account: string = ''
  @State pwd: string = ''
  @State message: string = 'Index Page'
  // @State params: Object = router.getParams()
  @State src: string = ''
  //
  // onPageShow() {
  //   let params: Object = router.getParams()
  //   console.log(`收到的 router 传参：${JSON.stringify(params)}`)
  //   if (params) {
  //     let src = params["src"]
  //     console.log(`收到的 router 传参：${src}`)
  //   }
  // }

  onPageShow() {
    const params: Record<string, Object> = { '': router.getParams() }; // 获取传递过来的参数对象
    const info: Object = params['src']; // 获取info属性的值
    console.log(`收到的 router 传参：${JSON.stringify(info)}`)
  }

  build() {
    Scroll() {
      Row() {
        Column() {
          this.test2()
        }
        .width('100%')
      }
      .height('100%')
    }
  }

  @Builder test2() {

    LoadingProgress()
      .color(Color.Orange)
      .width(60)
      .height(60)

    TextInput({
      placeholder: "账号"
    })
      .width('80%')
      .height(60)
      .fontColor(Color.Red)
        // .placeholderColor(Color.Blue)
      .placeholderFont({
        // size: 20,
        weight: FontWeight.Medium,
        family: 'cursive',
        style: FontStyle.Italic
      })
      .margin(20)
      .onChange((value: string) => {
        this.account = value
        BALogger.info(value)
      })

    Text(this.account)

    TextInput({
      placeholder: "密码"
    })
      .type(InputType.Password)
      .width('80%')
      .height(60)
      .margin(20)
      .onChange((value: string) => {
        this.pwd = value
        BALogger.info(value)
      })

    Text(this.pwd)
      .margin(40)

    /*
     * Capsule：胶囊型按钮（圆角默认为高度的一半）。
     * Circle：圆形按钮。
     * Normal：普通按钮（默认不带圆角）。
     * */
    // Button($r('app.string.LoginButton_text'), {
    //   type: ButtonType.Capsule,
    //   stateEffect: true
    // })
      // .width($r('app.float.LoginButton_width'))
      // .height($r('app.float.LoginButton_height'))
      // .backgroundColor($r('app.color.LoginButton_color'))
      // .onClick(()=> {
      //   BALogger.info("点击了登录")
      // })


  }

  @Builder test1() {

    //为了成功加载网络图片，您需要在module.json5文件中申明网络访问权限。
    Image('https://lmg.jj20.com/up/allimg/1113/031920120534/200319120534-7-1200.jpg')

    /*
     * ImageFit包含以下几种类型：
       Contain：保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。
       Cover（默认值）：保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。
       Auto：自适应显示。
       Fill：不保持宽高比进行放大缩小，使得图片充满显示边界。
       ScaleDown：保持宽高比显示，图片缩小或者保持不变。
       None：保持原有尺寸显示。
     * */
    Image($r('app.media.123'))
      .objectFit(ImageFit.Contain)


    Image($r('app.media.app_icon'))
      .width(100)
      .height(100)
      .margin(20)


    Text(this.tip)
      .width(200)
      .textAlign(TextAlign.End)
      .backgroundColor(0xE6F2FD)


    Text(this.tip)
      .fontColor(Color.Blue)
      .fontSize(40)
      .fontStyle(FontStyle.Italic)
      .fontWeight(FontWeight.Bold)
      .fontFamily('Arial')

    Text('This is the text content of Text Component This is the text content of Text Component')
      .maxLines(1)
      .width(300)
      .fontSize(20)
      .backgroundColor(0xE6F2FD)
      .textOverflow({
        overflow: TextOverflow.Ellipsis
      })
      .decoration({
        type: TextDecorationType.LineThrough,
        color: Color.Red
      })
      .margin(20)

    Text(this.message)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)

    Text(this.src)
      .fontSize(20)

    Button('Next')
      .backgroundColor(Color.Blue)
      .fontColor(Color.White)
      .fontSize(30)
      .width('80%')
      .height(60)
      .margin(40)
      .onClick(() => {
        console.log("点击了 Next 按钮")

        router.pushUrl({
          url: 'pages/SecondPage',
          params: {
            msg: 'Index Page 传过来的内容'
          }
        }).catch(() => {
          BALogger.info(TAG, 'IndexPage push error')
        })
      })
  }
}