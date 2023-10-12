//: [Previous](@previous)

import Foundation


var dict1: [String: Int] = ["a": 1, "b": 2]
var dict2: [String: Int] = ["c": 3, "d": 4]

for key in dict2.keys {
    dict1[key] = dict2[key]
}

print(dict1)


// уникальные элементы


var inputArray = [1, 2, 3, 4, 4, 5, 5]
var uniqueSet: [Int] = []

for element in inputArray {
    var isUnique = true
    for uniqueElement in uniqueSet {
        if element == uniqueElement {
            isUnique = false
            break
        }
    }
    if isUnique {
        uniqueSet.append(element)
    }
}
print(uniqueSet)


// подмножества


var setA: [Int] = [1, 2, 3]
var setB: [Int] = [1, 2, 3, 4, 5]
var isSubset = true

for elementA in setA {
    var found = false
    for elementB in setB {
        if elementA == elementB {
            found = true
            break
        }
    }
    if !found {
        isSubset = false
        break
    }
}
print(isSubset ? "A is a subset of B" : "A is not a subset of B")

// ================== 1

let inputArray1 = [1, 2, 3, 4, 4, 5, 5]
let uniqueSet1 = Set(inputArray1)
print(Array(uniqueSet1))


// ==================== 2

let setA1: Set = [1, 2, 3]
let setB1: Set = [1, 2, 3, 4, 5]
let isSubset1 = setA1.isSubset(of: setB1)
print(isSubset1 ? "A1 is a subset of B1" : "A1 is not a subset of B1")

//: [Next](@next)
