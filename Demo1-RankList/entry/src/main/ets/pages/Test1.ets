
export class Person {
  private name: string
  private age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }

  public getPersonInfo(): string {
    return `My name is ${this.name} and age is ${this.age}`
  }

}

export class Employee extends Person {
  private department: string

  constructor(name: string, age: number, department: string) {
    super(name, age)
    this.department = department
  }

  public getEmployeeInfo():string {
    return this.getPersonInfo() + ` and employee is ${this.department}}`
  }

}


// class Pa {
//   let person1 = new Person("json", 18)
//   person1.getPersonInfo()
//
//   let person2 = new Employee("boai", 18, "打工仔")
//   person2.getEmployeeInfo()
// }