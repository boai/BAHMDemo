
@Observed
class ClassA {
  prob1: number = 0
  prob2: string = "This is Prop2"
  prob3: ClassB = new ClassB()
}

@Observed
class ClassB {
  subProb1: number = 100
}




