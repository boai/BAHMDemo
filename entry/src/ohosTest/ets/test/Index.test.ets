import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function IndexTest() {
  describe('IndexTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.


      let isDone: boolean = false
      let count: number = 10
      let hexNum: number = 0xFFFFFF
      let hexNum2: number = 0x7f7
      let msg: string = "test"
      let nums: number[] = [1, 2, 3, 5, 8]
      let list: Array<number> = [1, 3, 5, 7, 9]
      let list2: [number, string]
      list2 = [1, "aaa"]

      enum Color {red, green, black}

      let c: Color = Color.red

      //TypeScript里，undefined和null两者各自有自己的类型分别叫做undefined和null。
      let u: undefined = undefined
      let n: null = null

      //联合类型（Union Types）表示取值可以为多种类型中的一种。
      let myNum: string | number
      myNum = 123
      myNum = "hello"

      test()

      var num: number = 5
      if (num % 2 == 0) {
        console.log("num 是偶数")
      } else {
        console.log("num 是基数")
      }

      switch (num) {
        case 1: {
          console.log("1")
          break
        }
        case 2: {
          console.log("2")
          break
        }
      }


      function add(x, y) {
        return x + y
      }

      let myAdd = function (x, y) {
        return x + y
      }

      function add2(x: number, y: number): number {
        return x + y
      }



    })

    function test(): void {
      console.log('This is function is void');
    }


    it('assertEqual', 0, function () {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let a = 'test'
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertEqual('test')
    })
  })
}