//: [Previous](@previous)

import Foundation

// ============= (не)изменяемость

var array1: [Int] = [1] // переменная
let array2: [Int] = [1] // константа

array1.append(2)
//array2.append(2)




















// ================== массивы

// создание

//var ints0 = Array<Int>.init()
var ints1 = [Int]()
var ints2: [Int] = []














ints1 = []

var defaults1 = Array(repeating: 0.0, count: 10)

print(defaults1)

var defaults2 = Array(repeating: 1.0, count: 10)

print(defaults2)

var defaults3 = defaults1 + defaults2
defaults1.append(contentsOf: defaults2)

print(defaults3)

ints2.append(contentsOf: 1...10)

print(ints2)










// методы

let count = defaults3.count

if ints1.isEmpty {
    print("empty")
} else {
    print("not empty")
}










// добавление

var str1 = ["qqq"]
str1.append("www")

print(str1)

str1 += ["eee"]
str1 += ["rrr", "ttt", "yyy"]

print(str1)

// адресация

var firstStr1 = str1[0]

str1[0] = "aaa"

print(str1)

str1[1...2] = ["sss", "ddd"]

print(str1)

str1[4...5] = ["fff", "ggg"]

print(str1)

str1.insert("xxx", at: 0)

print(str1)

let removedValue = str1.remove(at: 0)

print(removedValue)
print(str1)

let removedLast = str1.removeLast()

print(str1)










// перебор всех элементов

for str in str1 {
    print(str)
}

for (index, str) in str1.enumerated() {
    print("\(index): \(str)")
}














// ================= множества

// создание

var floats = Set<Float>()
var floats2: Set<Float> = []
var strings: Set<String> = ["qqq", "www", "eee", "qqq", "www", "eee", "qqq", "www", "eee", "qqq", "www", "eee", "qqq", "www", "eee"]

print("Set<Float> с \(floats.count) элементами.")

// доступ

floats.insert(1.0)
floats2.insert(1.0)
floats = []


print(strings)

strings.remove("www")

if let removedString = strings.remove("qqq") {
    print("\(removedString)")
} else {
    print("нет такого элемента")
}

print(strings)

if strings.contains("eee") {
    print("есть")
} else {
    print("нет")
}
print(strings)

// перебор всех элементов

let defaults4: [Float] = Array(repeating: 0.0, count: 10)
var numbers: Set<Float> = Set(defaults4)

for number in numbers.sorted() {
    print("\(number)")
}

// операции

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let otherNumbers: Set = [2, 3, 5, 7]

let oddDigitsIntersection: Set = [1, 3, 111]

oddDigits.union(evenDigits).sorted()

oddDigits.intersection(evenDigits).sorted()
oddDigits.intersection(oddDigitsIntersection).sorted()
evenDigits.intersection(otherNumbers).sorted()

oddDigits.subtracting(otherNumbers).sorted()

oddDigits.symmetricDifference(otherNumbers).sorted()

let bigSet: Set = [1, 3, 5]
let smallSet: Set = [1, 3]

let isSubset = smallSet.isSubset(of: bigSet)
let isSuperset = oddDigits.isSuperset(of: smallSet)
let isDisjoint = bigSet.isDisjoint(with: evenDigits)


// ================== словари

// создание

var dict1 = [Int: String]()
var dict2: [Int: String] = [:]
var dict3: [Int: String] = [11: "elf", 12: "zwölf"]
var dict4: [String: String] = ["qqq": "elf", "www": "zwölf"]

dict1[0] = "sixteen"

print(dict1)

dict1 = [:]

print("\(dict3.count)")

if dict2.isEmpty {
    print("is empty.")
} else {
    print("is not empty.")
}

dict4["eee"] = "dreizehn"

dict4["ttt"] = "ttt"

print(dict4)

if let oldValue = dict4.updateValue("hello", forKey: "ttt") {
    print("old value == \(oldValue).")
}

print(dict4)

// перебор значений

for (key, value) in dict4 {
    print("\(key): \(value)")
}

for key in dict4.keys {
    print("\(key)")
}

for value in dict4.values {
    print("\(value)")
}

let keys = [Int](dict3.keys)
print(type(of: keys))
let values = [String](dict4.values)
print(type(of: values))







//: [Next](@next)
