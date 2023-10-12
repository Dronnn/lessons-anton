//: [Previous](@previous)

import Foundation


// Создайте псевдоним для `Int`.

typealias Coordinata = Int

// Создайте псевдоним для кортежа, представляющего координаты точки.

typealias Point = (Coordinata, Coordinata, Coordinata)

var zero = (x: 0, y: 0, z: 0)

zero.x
zero.y
zero.z

// =======================

// Создайте кортеж для хранения информации о студенте (имя, возраст, средний балл).

typealias Age = Int
typealias MiddleBall = Double

typealias StudentInfo = (String, Age, MiddleBall)

let student1: StudentInfo = ("vasya", 21, 4.5)

print("student = \(student1.0)")
print("age = \(student1.1)")
print("balls = \(student1.2)")

let (name, age, ball) = student1
print("student = \(name)")
print("age = \(age)")
print("balls = \(ball)")



// Распакуйте кортеж в переменные.

//: [Next](@next)
