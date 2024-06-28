
//九九乘法表
export function multiplicationTable(): string[][] {
  let result: string[][] = []
  for (let i = 1; i < 9; i++) {
    let index: string[] = []
    for (let j = 1; j <= i; j++) {
      let temp: string = j + " * " + i + " = " + i * j
      index.push(temp)
    }
    result.push(index)
  }
  return result
}