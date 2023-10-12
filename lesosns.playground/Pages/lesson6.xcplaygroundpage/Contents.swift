//: [Previous](@previous)

import Foundation

var greeting = "closures"


// замыкания в Swift — это блоки кода, которые могут быть переданы и использованы в программе как значения.
// они похожи на функции, но имеют более гибкую синтаксическую форму.

// синтаксис замыкания:

// { (параметры) -> тип_возврата in
//     // код замыкания
// }


// тип кложура

// (a: Int, b: Int) -> ()
// () -> Void

















typealias Closure1 = () -> Void
typealias Closure2 = (Int) -> Int
typealias Closure3 = (Int, Double, String) -> (Int, Int)

let x0: () -> Void = { }
x0()

let xx = 11

let x1: Closure1 = {
    print(xx)
}
x1()


let x2: Closure2 = { _ in
    return 1
}
x2(1)

let x3: Closure3 = { a, b, c in
    return (a + a, 2)
}

x3(1, 1.0, "s")







// простой пример замыкания, который суммирует два числа:

let sumClosure = { (a: Int, b: Int) -> Int in
    return a + b
}
let result1 = sumClosure(5, 3)

// то же самое но как номральная функция

func sumFunction(_ a: Int, _ b: Int) -> Int {
    return a + b
}
let result2 = sumFunction(5, 3)











// пример

let names = ["andrew", "anton"]

var reversedNames0 = names.sorted { s1, s2 in
    s1 > s2
}

var reversedNames1 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})












// определение типа результата из контекста

var reversedNames2 = names.sorted(by: { s1, s2 in
    return s1 > s2
})

// неявные возвращаемые значения из замыканий с одним выражением

var reversedNames3 = names.sorted(by: { (s1: String, s2: String) in
    s1 > s2
})











// сокращенные имена аргументов

//func sorted(by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows -> [Self.Element]

var reversedNames4 = names.sorted(by: {
    $0 > $1
})

















// последующее замыкание

func someFunctionThatTakesA(closure: () -> Void) {
    // тело функции
    closure()
}

// вызовбез использования последующего замыкания

someFunctionThatTakesA(closure: {
    // тело замыкания
})

// вызов с использованием последующего замыкания

someFunctionThatTakesA() {
    // тело последующего замыкания
}

someFunctionThatTakesA {
    // тело последующего замыкания
}

















// пример

var reversedNames5 = names.sorted { $0 > $1 }


// пример

typealias IntIntClosereInt = (Int, Int) -> Int

func performOperation(_ a: Int, _ b: Int, with closure: IntIntClosereInt) -> Int {
    closure(a, b)
}

let summarize: IntIntClosereInt = { a, b in
    a + b
}

let multiplyClosure: (Int, Int) -> Int = { a, b in
    a * b
}

let sumResult = performOperation(5, 3, with: summarize)
let multiplyResult = performOperation(5, 3, with: multiplyClosure)


let subtractResult1 = performOperation(5, 3, with: { (x, y) -> Int in
    return x - y
})

let subtractResult2 = performOperation(5, 3) { ($0 - $1) * 2 }














// реальный пример

// net manager

//func fetchData(from url: String, completion: @escaping (Data?, Error?) -> Void) {
//    guard let url = URL(string: url) else { return }
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        print(response ?? "")
//        completion(data, error)
//    }.resume()
//}
//
//// the screen
//
//fetchData(from: "https://jsonplaceholder.typicode.com/users") { data, error in
//    if let data = data {
//        print("Data received: \(data)")
//    } else if let error = error {
//        print("Error: \(error)")
//    }
//}










// захват значений


var counter = 0

var incrementByTwo: () -> Int = {
    counter += 2
    return counter
}

let firstCall = incrementByTwo()
let secondCall = incrementByTwo()


















// автокложуры

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}

let x = 4
let y = 5
logIfTrue(x > y)
logIfTrue(x < y)
















// сбегающие замыкания

func performAsyncOperation(completion: @escaping (String) -> Void) {
    print("start")
    
    DispatchQueue.global().async {
        
        sleep(2)
        
        print("middle")
        
        completion("Operation Complete")
    }
    
    print("finish")
}

performAsyncOperation { message in
    print(message)
}






//: [Next](@next)
