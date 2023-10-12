//: [Previous](@previous)
import Foundation

// === переменные и константы ===

let number = 10
var current = 0

var x = 0.0, y = 0.0, z = 0.0

var welcome = "hello!"
welcome = "hi!"

// === типы ===

var helloMessage: String
helloMessage = "QhelloQw"
var isHelloEmpty = helloMessage.isEmpty
var isPrefixQ = helloMessage.hasPrefix("Q")
var isSuffixQ = helloMessage.hasSuffix("Qw")

var red, green, blue: Double
var int8: Int = 127123124234111111

// === print ===

print(welcome)

print("Текущее значение friendlyWelcome равно \(welcome)")



// === комментарии ===

// это комментарий

/*
 это тоже комментарий,
 но написанный на двух строках
 */

// === Точки с запятой ===

let name = "?"; print(name)


// === Целые числа Int, UInt ===

let minValue = Int.min
let maxValue = Int.max

// === Числа с плавающей точкой Double, Float ===

let minValueDouble = -Double.greatestFiniteMagnitude
let maxValueDouble = Double.greatestFiniteMagnitude

let minValueFloat1 = -Float.greatestFiniteMagnitude
let minValueFloat2 = -Float.infinity

let maxValueFloat1 = Float.greatestFiniteMagnitude
let maxValueFloat2 = Float.infinity



// === строгая типизация и вывод типов ===

var age: UInt8 = 42

let thousand: UInt16 = 1_000

let one: UInt8 = 1

let summ = thousand + UInt16(one)

let value = 3
let fraction = 0.14159
let pi = Double(value) + fraction

let integerPi = Int(pi)

// === Логические типы ===

let isItTrue = true
let isItFalse: Bool = false
// === Опциональные типы ===

let possibleNumber = "qq"
let convertedNumber = Int(possibleNumber)

var response: Int? = 404
response = nil

let optionalString: String? = "An optional string"
let nonOptionalString: String = optionalString!

// === Кортежи ===

let myErrorData = (404, "Not Found")

print("The status code is \(myErrorData.0)")
print("The status message is \(myErrorData.1)")


let (code, message) = myErrorData
print("The status code is \(code)")
print("The status message is \(message)")

let (codeNumber, _) = myErrorData
print("The status code is \(codeNumber)")

// === Псевдонимы типов ===

typealias Age = Int
typealias MyData = (Int, String, Float, Bool)

var data: MyData = (22, "qqq", 3.14, false)

var isAndrew = true
var isPetr = false


!((isAndrew && isPetr) && (isAndrew && isPetr)) || ((isAndrew && isPetr) && (isAndrew && isPetr))
isAndrew || isPetr


//: [Next](@next)
