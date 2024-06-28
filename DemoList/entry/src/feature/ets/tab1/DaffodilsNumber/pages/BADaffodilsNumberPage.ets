import { BACommonConstant } from '../../../../../Util/Constant/BACommonConstant'
import { multiplicationTable } from '../Utils/Methods'
import { BAMultiplicationTableCustomDialog } from '../view/BAMultiplicationTableCustomDialog'

@Component
export struct BADaffodilsNumberPage {

  multiplicationTableCustomDialogController: CustomDialogController | null = new CustomDialogController({
    builder: BAMultiplicationTableCustomDialog(),
    alignment: DialogAlignment.Center,
    offset: {dx: 0, dy: -25}
  })



  build() {

    Column() {
      Text("ArkTS开发案例")
        .width("90%")
        .font({ size: 30, weight: 700 })
        .margin({
          top: 64,
          bottom: 8,
          left: 12,
          right: 20
        })

      Column() {
        Button("打印水仙花数")
          .width(288)
          .height(40)
          .onClick(()=>{
            let x: number | null = null
            let x1: string = 100

          })
        Button("打印九九乘法表")
          .width(288)
          .height(40)
          .margin({top: 12, bottom: 20})
          .onClick(()=>{
this.multiplicationTableCustomDialogController?.open()
            let result = multiplicationTable()
            for (let index = 0; index < result.length; index++) {
              let element = result[index].toString();
              console.log(element)
            }
          })


      }
      .width(BACommonConstant.kFULL_WIDTH)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(BACommonConstant.kFULL_WIDTH)
    .height(BACommonConstant.kFULL_HEIGHT)
  }
}