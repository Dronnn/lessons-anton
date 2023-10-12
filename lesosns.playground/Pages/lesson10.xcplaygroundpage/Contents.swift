//: [Previous](@previous)

import Foundation

var greeting = "Hello, OOP"


// поговорим о ООП (объектно-ориентированном программировании)
//
// **1. Введение в ООП:**
// ООП — это парадигма программирования, в которой программы создаются на основе объектов. Эти объекты представляют собой экземпляры классов.
//
// четыре принципа которые являются основными столпами объектно-ориентированного программирования
//
// 1. Абстракция:
// ООП позволяет моделировать реальный мир с помощью объектов, представляющих сущности, и операций над ними. Абстракция помогает сосредоточиться на основных характеристиках объекта, игнорируя нерелевантные детали.

// 2. Инкапсуляция:
// Это процесс сокрытия внутренних деталей реализации объекта и предоставления только необходимых для взаимодействия с ним интерфейсов. Это помогает изолировать функциональность объекта и защищать его внутренний код от нежелательных изменений.

// 3. Наследование:
// Это механизм, позволяющий создавать новый класс на основе уже существующего (родительского) класса. Новый класс наследует атрибуты и методы родительского класса и может их дополнять или переопределять.

// 4. Полиморфизм:
// Это способность объектов разных классов обрабатываться как объекты одного и того же класса. В основе полиморфизма лежит принцип, что разные объекты могут поддерживать одни и те же интерфейсы или методы, но реализовывать их по-разному.

// **2. Основные принципы ООП:**
// a) **Инкапсуляция** - сокрытие деталей реализации, показывая только функциональность.

//let x = BankAccount()
//x.balance = 1
//x.number

public class BankAccount {
    private var balance: Double = 0.0
    private(set) var number: Int = 0
    public func deposit(amount: Double) {
        balance += amount
    }
}

// модификаторы доступа - private, private(set), public, open, internal

class Human {
    private let DNA: String = "!@#$%^&*"
    private(set) var name: String = ""
    func changeName(to newName: String) {
        name = newName
    }
}


// b) **Наследование** - возможность создания нового класса на основе существующего.

protocol Searchable {
    func doSearch() -> Bool
}

class Animal {
    func sound() -> String {
        return "Some generic sound"
    }
    func move() -> String {
        return "The animal moves"
    }
}

class Dog: Animal, Searchable {
    override func sound() -> String {
        return "Bark"
    }
    override func move() -> String {
        return super.move() + " by running"
    }
    func doSearch() -> Bool {
        return true
    }
    func sleep() { }
}

class Cat: Animal {
    override func sound() -> String {
        return "Meow"
    }
    override func move() -> String {
        return super.move() + " by crawling"
    }
}

class Bird: Animal {
    override func sound() -> String {
        return "Tweet"
    }
    override func move() -> String {
        return super.move() + " by flying"
    }
    func fly() { }
}

class Waterfowl: Bird {
    override func move() -> String {
        return super.move() + " by swiming"
    }
    
    override func sound() -> String {
        return "squawk"
    }
    func sweam() {}
//    override func fly() {
//        <#code#>
//    }
}

class Penguins: Waterfowl {
    
}

// c) **Полиморфизм** - возможность использовать объекты разных классов одинаковым образом.

func playSound(of animal: Animal) {
    print(animal.sound())
}

let myDog = Dog()
let myCat = Cat()
let myBird = Bird()
let myPinguin = Waterfowl()

playSound(of: myDog)
print(myDog.move())

playSound(of: myCat)
print(myCat.move())

playSound(of: myBird)
print(myBird.move())

playSound(of: myPinguin)
print(myPinguin.move())


// d) **Абстракция** - представление реального объекта в программировании.

class Car {
    var color: String
    var brand: String
    init(color: String, brand: String) {
        self.color = color
        self.brand = brand
    }
}


// ==============================================


class Parent {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}


class Child: Parent {
    var description: String
    
    init(title: String, description: String) {
        self.description = description
        super.init(title: title)
    }

    init(description: String) {
        self.description = description
        super.init(title: "qwerq")
    }

}




// ==============================================

// **3. Ключевые слова в Swift, связанные с ООП:**
// - **class:** Для определения класса.
// - **init:** Конструктор класса для создания экземпляра.
// - **override:** Переопределение методов.
// - **super:** Обращение к родительскому классу.
// - **private, public, open, internal:** Модификаторы доступа.



//: [Next](@next)
