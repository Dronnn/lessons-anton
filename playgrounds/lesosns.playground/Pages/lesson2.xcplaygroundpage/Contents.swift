//: [Previous](@previous)

import Foundation




// ======== if



var firstNumber = 100
var secondNumber = -1

if firstNumber > 40, secondNumber == -1 {
    print("if")
} else if firstNumber >= 80, secondNumber == 1 {
    print("else if")
} else if firstNumber >= 80, secondNumber == 1 {
    print("else if")
} else if firstNumber >= 80, secondNumber == 1 {
    print("else if")
} else if firstNumber >= 80, secondNumber == 1 {
    print("else if")
} else if firstNumber >= 80, secondNumber == 1 {
    print("else if")
} else if firstNumber >= 80, secondNumber == 1 {
    print("else if")
} else {
    print("else")
}






















// ======== ternarny

let number = 7
let result = number % 2 == 0 ? "Even" : "Odd"
print("The number is \(result).")

























// ======== switch

let day = "Tuesday"

switch day {
case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday":
    print("It's a weekday")
case "Saturday", "Sunday":
    print("It's the weekend!")
default:
    print("Invalid day.")
}

let something = 555555

let x: Bool = true

switch x {
case true:
    break
case false:
    break
}

switch something {
case 1...5, 6...10:
    print("1...10")
case 11...20:
    print("11...20")
case 30...40:
    break
case 50...60:
    fallthrough
case 60...70:
    print("60...70")
default:
    print("default")
}

let tuple = (true, false)

switch tuple {
case (true, true): print("1, 1")
case (false, false): print("0, 0")
default: print("default")
}

switch tuple {
case let (x, y) where x != y: print("не равно \(x)")
case let (x, y) where x == y: print("равно")
case (let x, _) where x == x: print("xxx")
default: print("qqq")
}


















// ======== for

for index in 1 ..< 5 {
    print("\(index) умножить на 5 будет \(index * 5)")
}


for (number, name) in ["Anna", "Alex", "Brian", "Jack"].enumerated() {
    print("Hello, \(number), \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (key, value) in numberOfLegs {
    print("\(key)s have \(value) legs")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) в степени \(power) равно \(answer)")

for tickMark in stride(from: 0, to: 100, by: 30) {
    print(tickMark)
}





















// ======== while

var sum = 0
var i = 111

while i <= 10 {
    sum += i
    i += 1
}

print("The sum of numbers from 1 to 10 is \(sum)")
















// ======== repeat - while

var sum1 = 0
var i1 = 111

repeat {
    sum1 += i1
    i1 += 1
} while i1 <= 10

print("The sum1 of numbers from 1 to 10 is \(sum1)")

















// ====== break

for i in 1...10 {
    if i == 5 {
        break
    }
    print("Loop iteration \(i)")
}

// ======= continue

for i in 1...10 {
    if i % 2 != 0 {
        continue
    }
    print("Even number \(i)")
}




















// ====== label

var rez = 0
loop1: for i in 1...10 {
    for j in 1...10 {
        if i == 5, j == 5 {
            rez = i + j
            break loop1
        }
    }
}
print("i + j = \(rez)")


//: [Next](@next)
