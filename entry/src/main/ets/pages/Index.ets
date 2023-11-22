import { Person, Employee } from "../pages/Test1"

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {


      Column() {


        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text("---博")
          // .backgroundColor(Color.Yellow)
          .width(280)
          .fontSize(20)
          .fontColor(Color.Red)
          .textAlign(TextAlign.End)
      }
      .width('100%')
    }
    .height('100%')
    .onAppear(() => {
      let num = add(1, 6)
      console.log(`num add：${num}`)

      let person1 = new Person("json", 18)
      console.log(person1.getPersonInfo())

      let person2 = new Employee("boai", 18, "打工仔")
      console.log(person2.getEmployeeInfo())

    })
  }
}

function add(x, y) {
  return x + y
}