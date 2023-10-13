//: [Previous](@previous)

import Foundation

//Задача: "Зоопарк". Создайте систему классов и протоколов для зоопарка.

// Общий протокол для всех животных
protocol Animal { } // маркер

protocol SoundMaking {
    func makeSound() -> String
}

protocol Moving {
    func move() -> String
}

class Lion: Animal, SoundMaking, Moving {
    func makeSound() -> String {
        "Рррр!"
    }
    
    func move() -> String {
        "Лев бежит"
    }
}

class Snake: Animal, Moving {
    func move() -> String {
        "Змея ползет"
    }
}

class Parrot: Animal, SoundMaking {
    func makeSound() -> String {
        "Привет!"
    }
}

// Теперь создадим массив всех животных
let animals: [Animal] = [Lion(), Snake(), Parrot()]

// И обработаем их
for animal in animals {
    if let soundMaker = animal as? SoundMaking {
        print(soundMaker.makeSound())
    }
    
    if let mover = animal as? Moving {
        print(mover.move())
    }
}

// -===================================

// создадим пример с функцией, которая пытается получить число из массива по индексу. Если индекс вне диапазона, функция выбросит ошибку. Если массив пустой, то тоже выбросит ошибку.

enum ArrayError: Error {
    case indexOutOfBound
    case arrayIsEmpty
}

func getNumber(
    from array: [Int],
    at index: Int
) throws -> Int {
    guard !array.isEmpty else {
        throw ArrayError.arrayIsEmpty
    }
    
    guard 
        index >= 0,
        index < array.count
    else {
        throw ArrayError.indexOutOfBound
    }
    
    return array[index]
}

let numbers = [10, 20, 30, 40, 50]

do {
    let number = try getNumber(from: numbers, at: 30)
    print("Число: \(number)")
} catch ArrayError.arrayIsEmpty {
    print("Ошибка: массив пуст!")
} catch ArrayError.indexOutOfBound {
    print("Ошибка: индекс вне диапазона!")
} catch {
    print("Неизвестная ошибка: \(error)")
}


//: [Next](@next)
