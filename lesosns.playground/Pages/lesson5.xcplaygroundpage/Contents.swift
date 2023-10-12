//: [Previous](@previous)

import Foundation
import UIKit

var greeting = "function"

// функции

// терминология
// - подпрограмми
// - функция
// - процедура
// - метод

// объявление и вызов функций


func handle() {
    print("hello")
}

handle()


func printUserProfile(name: String, age: Int, language: String) {
    print("name: \(name)")
    print("age: \(age)")
    print("programming language: \(language)")
}

printUserProfile(name: "andreas", age: 30, language: "swift")
















// возвращаемые значения

func getJSONData() -> String {
    return "{ \"id\": 1, \"title\": \"name1\" }"
//    "{ \"id\": 1, \"title\": \"name1\" }"
}

var x = getJSONData()










// параметры функции

func average(numbers: [Double]) -> Double {
    var sum: Double = 0
    for number in numbers {
        sum += number
    }
    return sum / Double(numbers.count)
}

let mas = [1.0, 2.0, 3.0]
let averageRez = average(numbers: mas)
print(averageRez)

func getMoreJSONData(toggle: Bool) -> String {
    if toggle {
        return "{ \"id\": 2, \"title\": \"name2\" }"
    } else {
        return "{ \"id\": 3, \"title\": \"name3\" }"
    }
}

let data = getMoreJSONData(toggle: 1 < 0)
print(data)

func calculateArea(length: Double, width: Double) -> Double {
    return length * width
//     length * width
}

let area = calculateArea(length: 100, width: 100)
print(area)





















// игнорируем возвращаемое значение функции

_ = calculateArea(length: 200, width: 200)
















// функции, возвращающие несколько значений

func getMinMax(array: [Int]) -> (min: Int, max: Int) {
    var min = Int.max
    var max = Int.min
    
//    var min = array[0]
//    var max = array[0]

    
    for number in array {
        if number < min {
            min = number
        }
        
        if number > max {
            max = number
        }
    }
    
    return (min, max)
}

let result = getMinMax(array: [1, 2, 3, 4, 5])
print("min: \(result.min), max: \(result.max)")



















// опциональный возвращаемый тип

func findElementIndex(element: Int, in array: [Int]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == element {
            return index
        }
    }
    return nil
}

let mas1 = [1, 2, 3, 4, 5]

let index: Int? = findElementIndex(element: 3, in: mas1)

if let index = findElementIndex(element: 311, in: mas1) {
    print("element found at index \(index)")
} else {
    print("element not found")
}















// ярлыки аргументов и имена параметров функций

func sayHello(to person: String, from city: String) {
    print("Hello to \(person) from \(city)")
}

func say(_ hello: String, from city: String) {
    print("Hello to \(hello) from \(city)")
}

sayHello(to: "andreas", from: "yerevan")
say("anton", from: "moscow")

















// пропуск ярлыков аргумента

func multiply(_ a: Int, by b: Int) -> Int {
    return a * b
}
let result11 = multiply(4, by: 5)















// значения по умолчанию для параметров

func greet(name: String, withGreeting greeting: String = "hello") {
    print("\(greeting), \(name)!")
}

greet(name: "andreas")
greet(name: "andreas", withGreeting: "Hi")
greet(name: "andreas", withGreeting: "Bonjour")
greet(name: "andreas", withGreeting: "Привет")























// вариативные параметры

func sum(_ numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

let result1 = sum(1, 2, 3)
let result2 = sum(10, 20, 30, 40)
let result3 = sum(10, 20, 30, 40, 10, 20, 30, 40,10, 20, 30, 40,10, 20, 30, 40,10, 20, 30, 40,10, 20, 30, 40)


















// сквозные параметры

func swapTwoInts1(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

func swapTwoInts2(_ a: inout Int, _ b: inout Int) {
    (a, b) = (b, a)
}

var num1 = 1
var num2 = 2
swapTwoInts1(&num1, &num2)
print(num1, num2)

var num11 = 10
var num22 = 20
swapTwoInts2(&num11, &num22)

print(num11, num22)
















// вложенные функции

func outerFunction(shouldPrint: Bool) {
    func innerFunction() {
        print("Inner function called!")
    }
    
    if shouldPrint {
        innerFunction()
    }
}

outerFunction(shouldPrint: true)
outerFunction(shouldPrint: false)


//: [Next](@next)
