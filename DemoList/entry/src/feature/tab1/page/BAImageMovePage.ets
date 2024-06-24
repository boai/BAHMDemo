@Observed
export class BAUIStyle {
  translateX: number = 0
  translateY: number = 0
  scaleX: number = 0.3
  scaleY: number = 0.3
  posX: number = 10
  posY: number = 50
  width: number = 336
  height: number = 178
  alpha: number = 0.5
  borderRadius: number = 24
  imageWidth: number = 78
  imageHeight: number = 78
  translateImageX: number = 0
  translateImageY: number = 0
  fontSize: number = 20
}

@Component
struct SpecialImage {
  @ObjectLink uiStyle: BAUIStyle;

  private isRenderSpecialImage(): number { // function to show whether the component is rendered
    console.log("SpecialImage is rendered");
    return 1;
  }

  build() {
    Image($r('app.media.icon'))
      .width(this.uiStyle.imageWidth)
      .height(this.uiStyle.imageHeight)
      .margin({ top: 20 })
      .translate({
        x: this.uiStyle.translateImageX,
        y: this.uiStyle.translateImageY
      })
      .opacity(this.isRenderSpecialImage()) // if the Image is rendered, it will call the function
  }
}

/**
 * 下面的示例代码为一个较典型的冗余刷新场景。
 */
@Component
export struct BAImageMovePage {
  @ObjectLink uiStyle: BAUIStyle;

  private isRenderColumn(): number {
    console.log("Column is rendered")
    return 1
  }

  private isRenderStack(): number {
    console.log("Stack is rendered")
    return 1
  }

  private isRenderImage(): number {
    console.log("Image is rendered")
    return 1
  }

  private isRenderText(): number {
    console.log("Text is rendered")
    return 1
  }

  /**
   * 在上面的示例中，UIStyle定义了多个属性，并且这些属性分别被多个组件关联。
   * 当点击任意一个按钮更改其中的某些属性时，根据上文介绍的机制，会导致所有这些关联uiStyle的组件进行刷新，
   * 虽然它们其实并不需要进行刷新（因为组件的属性都没有改变）。通过定义的一系列isRender函数，
   * 可以观察到这些组件的刷新。当点击“move”按钮进行平移动画时，由于translateX与translateY的值的多次改变，
   * 会导致每一帧都存在冗余刷新的问题，这对应用的性能有着很大的负面影响。
   */

  build() {
    Column() {
      // SpecialImage({uiStyle: this.uiStyle})
      // when you compile this code in API9, IDE may tell you that
      // "Assigning the '@ObjectLink' decorated attribute 'uiStyle' to the '@ObjectLink' decorated attribute 'uiStyle' is not allowed. <etsLint>"
      // But you can still run the code by Previewer
      SpecialImage({
        uiStyle: this.uiStyle
      })

      Stack() {
        Column() {
          Image($r("app.media.app_icon"))
            .opacity(this.uiStyle.alpha)
            .scale({
              x: this.uiStyle.scaleX,
              y: this.uiStyle.scaleY
            })
            .opacity(this.isRenderImage())
            .width(300)
            .height(300)
        }
        .width("100%")
        .position({ y: -80 })

          Stack() {
            Text("Hello World")
              .fontColor(Color.Pink)
              .fontWeight(FontWeight.Medium)
              .fontSize(this.uiStyle.fontSize)
              .opacity(this.isRenderText())
              .margin({ top: 12 })
          }
          .opacity(this.isRenderStack())
          .position({
            x: this.uiStyle.posX,
            y: this.uiStyle.posY
          })
          .width("100%")
          .height("100%")
        }
        .margin({ top: 58 })
        .borderRadius(this.uiStyle.borderRadius)
        .opacity(this.isRenderStack())
        .backgroundColor(Color.White)
        .width(this.uiStyle.width)
        .height(this.uiStyle.height)
        .translate({
          x: this.uiStyle.translateX,
          y: this.uiStyle.translateY
        })

        Column() {
          Button("移动")
            .width(312)
            .fontSize(20)
            .backgroundColor("#FF007DFF")
            .margin({bottom: 10})
            .onClick(()=>{
              animateTo({
                duration: 500
              }, ()=> {
                this.uiStyle.translateY = (this.uiStyle.translateY + 180)%250
              })
            })

          Button("缩放")
            .borderRadius(20)
            .backgroundColor("#FF007DFF")
            .fontSize(20)
            .width(312)
            .onClick(() => {
              this.uiStyle.scaleX = (this.uiStyle.scaleX + 0.6) % 0.8
            })
        }
        .position({y:666})
        .width("100%")
        .height("100%")
      }
      .opacity(this.isRenderColumn())
      .width("100%")
      .height("100%")
    }
}







