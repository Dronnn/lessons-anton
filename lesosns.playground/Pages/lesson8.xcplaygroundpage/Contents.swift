//: [Previous](@previous)

import Foundation

var greeting = "Hello, structs"

// class - ссылочный тип
// struct - тип значение

// Int, Double, String, Array, Dictionary, Set - value types

//class Brik {
//    var size: Float = 0
//}
//
//var b1: Brik = Brik()
//var b2: Brik = b1
//
//b1.size = 1
//print(b2.size)
//
//var x: Int = 0
//var y: Int = x
//
//x = 1
//print(y)
//

//class Car1 {
//    var brand: String
//    var model: String
//    var year: Int
//    
//    init(brand: String, model: String, year: Int) {
//        self.brand = brand
//        self.model = model
//        self.year = year
//    }
//}


struct Car {
    var brand: String
    var model: String
    var year: Int
    
    mutating func changBrand() {
        brand = "asdfasdf"
    }
}

var myCar = Car(brand: "toyota", model: "camry", year: 2020)
myCar.brand = "qwer"
print("car brand: \(myCar.brand)")


class Bike {
    var brand: String
    var model: String
    
    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
    
    func changeBrand() {
        brand = "qwer"
    }
}

let myBike = Bike(brand: "gt", model: "hardtail")
myBike.brand = "qwer"


















// mutable

struct Counter {
    var count: Int
    
    mutating func increment() {
        count += 1
    }
    
    mutating func reset() {
        count = 0
    }
}

var myCounter = Counter(count: 0)
print("initial count: \(myCounter.count)")

myCounter.increment()
print("after increment: \(myCounter.count)")

myCounter.reset()
print("after reset: \(myCounter.count)")














// all of it works for classes and structures
 
// get and set

struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        get {
            width * height
        }
        set(newArea) {
            width = sqrt(newArea / height)
        }
    }
    
    func getArea() {
        width * height
    }
    
    mutating func setArea(_ x: Double) {
        width = sqrt(x / height)
    }
    
}

var myRectangle = Rectangle(width: 10, height: 5)

myRectangle.setArea(1)
myRectangle.area = 1.0

print("area: \(myRectangle.getArea())")
print("area: \(myRectangle.area)")

// willSet, didSet

struct Circle {
    var radius: Double {
        willSet {
            print("about to set radius to \(newValue)")
        }
        didSet {
            print("radius was changed from \(oldValue) to \(radius)")
        }
    }
}

var myCircle = Circle(radius: 5)
myCircle.radius = 10












// static and class variables

struct Math1 {
    static let pi = 3.14159
    
    static func printPI() {
        print(Math1.pi)
    }
}

class Math2 {
    static let pi1 = 3.14159
    class var pi2: Double { 3.14159 }
    
    class func printPI1() {
        print(pi1)
    }
    static func printPI2() {
        print(pi2)
    }

}

var z = Math2.pi1

print(Math1.pi)
print(Math2.pi1)
print(Math2.pi2)
Math1.printPI()
Math2.printPI1()
Math2.printPI2()


struct Printer {
    static var data: Int = 0
    
    func print() {
        Swift.print(Printer.data)
    }
}

var x1 = Printer()
var x2 = Printer()

Printer.data = 1
x1.print()
Printer.data = 2
x2.print()

Printer.data = 3
print(Printer.data)




// deinit

class LightBulb {
    var isOn: Bool
    
    init() {
        isOn = false
        print("LightBulb created.")
    }
    
    func turnOn() {
        isOn = true
        print("Light is now on.")
    }
    
    func turnOff() {
        isOn = false
        print("Light is now off.")
    }
    
    deinit {
        print("LightBulb is being deallocated.")
    }
}

if true {
    let bulb = LightBulb()
    bulb.turnOn()
    bulb.turnOff()
}









//: [Next](@next)
