//: [Previous](@previous)

import Foundation

/*
 
 **Задача:** Создание системы управления зоопарком.
 
 **1. Абстракция:**
 Создайте базовый класс `Животное` с атрибутами `имя`, `вид` и методом `звук()`, который возвращает строку со звуком, который издает животное.
 
 **2. Инкапсуляция:**
 Создайте класс `СотрудникЗоопарка` с приватными атрибутами `зарплата` и публичными методами `получитьЗарплату()` и `установитьЗарплату()`.
 
 **3. Наследование:**
 На основе класса `Животное` создайте классы `Собака`, `Кот` и `Попугай`. Переопределите метод `звук()` для каждого из них, чтобы он возвращал соответствующий звук животного.
 
 **4. Полиморфизм:**
 В главном классе `Зоопарк` создайте массив животных разных видов и вызовите метод `звук()` для каждого из них в цикле.
 
 **5. Реализация:**
 Создайте экземпляры различных животных и сотрудников зоопарка. Продемонстрируйте работу всех методов и проверьте, как разные животные издают звуки.
 
 
 */


// 1. Абстракция
class Животное {
    var имя: String
    var вид: String
    
    init(имя: String, вид: String) {
        self.имя = имя
        self.вид = вид
    }
    
    func звук() -> String {
        return "Неизвестный звук"
    }
}

// 2. Инкапсуляция
class СотрудникЗоопарка {
    private var зарплата: Double
    
    init(зарплата: Double) {
        self.зарплата = зарплата
    }
    
    func получитьЗарплату() -> Double {
        return зарплата
    }
    
    func установитьЗарплату(_ новаяЗарплата: Double) {
        зарплата = новаяЗарплата
    }
}

// 3. Наследование
class Собака: Животное {
    override func звук() -> String {
        return "Гав-гав"
    }
}

class Кот: Животное {
    override func звук() -> String {
        return "Мяу"
    }
}

class Попугай: Животное {
    override func звук() -> String {
        return "Попугай говорит"
    }
}

// 4. Полиморфизм
class Зоопарк {
    var животные: [Животное]
    var сотрудник: СотрудникЗоопарка
    
    init(животные: [Животное], сотрудник: СотрудникЗоопарка) {
        self.животные = животные
        self.сотрудник = сотрудник
    }
    
    func демонстрацияЗвуков() {
        for животное in животные {
            print("\(животное.имя) говорит: \(животное.звук())")
        }
    }
}

// 5. Реализация
let собака = Собака(имя: "Бобик", вид: "Собака")
let кот = Кот(имя: "Мурка", вид: "Кот")
let попугай = Попугай(имя: "Кеша", вид: "Попугай")

let зоопарк = Зоопарк(животные: [собака, кот, попугай], сотрудник: СотрудникЗоопарка(зарплата: 10))
зоопарк.демонстрацияЗвуков()



















//: [Next](@next)