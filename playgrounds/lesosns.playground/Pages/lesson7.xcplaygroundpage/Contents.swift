//: [Previous](@previous)

import Foundation


// OPP - CLASSES


// cинтаксис объявления

class InspectorButton {
//    var image = Image()
//    var action: () -> Void = { }
//    var color = .red
//    var size = CGSize(width: 100, height: 100)
}

// экземпляры класса

//let redFich1 = Fish()
let fileInspector = InspectorButton.init()
let historyInspector = InspectorButton()
let helpInspector = InspectorButton()






















// проперти (поля)

class SomeClass2 {
    var someInt: Int = 1
    let someString = "qqq"
}

let some2 = SomeClass2()


SomeClass2().someInt
print(some2.someInt)
print(some2.someString)


// доступ к свойствам

class SomeClass3 {
    var some2 = SomeClass2()
}

let some3 = SomeClass3()
var someInt = some3.some2.someInt

some3.some2.someInt = 11
print(some3.some2.someInt)
some3.some2.someInt = 22
print(some3.some2.someInt)




















// инициализаторы

enum Color {
    case dark
    case light
}

class Dog {
    var name: String
    var breed: String
    var color: Color = .light
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    init(light: Bool) {
        self.name = ""
        self.breed = ""
        self.color = light ? .light : .dark
    }
    init() {
        self.name = ""
        self.breed = ""
        self.color = .dark
    }
}

let myDog = Dog(name: "Fido", breed: "Labrador")




class Fish {
    var name: String
    var linght: Double
    
    init(name: String, linght: Double) {
        self.name = name
        self.linght = linght
    }
    init(name: String) {
        self.name = name
        self.linght = 111
    }
    init(linght: Double) {
        self.name = "asdfgasdrfg"
        self.linght = linght
    }
    init() {
        self.name = "q"
        self.linght = 10
    }
}

var fishAkula = Fish(name: "akula", linght: 234.5)
var fishBarabulka = Fish(name: "barabulka", linght: 20.5)

fishAkula.name = "щука"
fishAkula.linght = 11343
Fish()
    var fishDefault = Fish()


















// методы

class Calculator {
    func add(_ a: Int, _ b: Int) -> Int {
        a + b
    }

    func subtract(_ a: Int, _ b: Int) -> Int {
        a - b
    }
}

let myCalculator = Calculator()

let sum = myCalculator.add(5, 3)
let difference = myCalculator.subtract(10, 3)
















// вычисляемые свойства

class Circle {
    var radius: Double // свойство, проперти, поле
    
    init(radius: Double) {
        self.radius = radius
    }

    func area1() -> Double {
        print("fulfilled!!!")
        return 3.14159 * radius * radius
    }
    
    var area: Double {
        print("fulfilled!!!")
        return 3.14159 * radius * radius
    }
    
    var circumference: Double {
        2 * 3.14159 * radius
    }
}

let myCircle = Circle(radius: 5)

let area = myCircle.area

myCircle.area
myCircle.area1()

let circumference = myCircle.circumference















//: [Next](@next)
