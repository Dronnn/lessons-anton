//: [Previous](@previous)

import Foundation

// Преобразуйте числовую оценку в буквенную (A, B, C, D, F).

switch 1 {
case 1: print("F"); fallthrough
case 2: print("D"); fallthrough
case 3: print("C"); fallthrough
case 4: print("B"); fallthrough
case 5: print("A"); fallthrough
default:
    print("error")
}









// Напишите код, который проверяет, является ли число четным или нечетным

var x = 35

if x % 2 == 0 {
    print("\(x) - Четное")
} else {
    print("\(x) - не Четное")
}


// Найдите минимальное из двух чисел без использования `if`.

var y = 35

var result = x < y ? "\(x) - min" : "\(y) - min"
//: [Next](@next)
