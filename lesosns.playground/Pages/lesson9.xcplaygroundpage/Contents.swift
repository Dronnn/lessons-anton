//: [Previous](@previous)

import Foundation


// **1. Guard**

func greet(person: [String: String]) {
    guard let name = person["man1"] else {
        print("Привет, незнакомец!")
        return
    }
    print("Привет, \(name)!")
}

greet(person: ["man1" : "vasya"])
greet(person: ["man2" : "petya"])

//
func processUserData(name: String?, age: Int?) {
    guard 
        let userName = name,
        let userAge = age, 
        userAge >= 18
    else {
        print("Недостаточно данных или возраст меньше 18 лет.")
        return
    }
    
    print("Привет, \(userName)! Тебе \(userAge) лет.")
}

processUserData(name: "vasya", age: 13)
processUserData(name: "vasya", age: nil)
processUserData(name: nil, age: 13)
processUserData(name: nil, age: nil)
processUserData(name: "petya", age: 21)

func describeItem(_ item: Any) {
    guard 
        let stringItem = item as? String
    else {
        print("Элемент не является строкой.")
        return
    }
    
    print("Элемент является строкой: \(stringItem)")
}

describeItem(11)
describeItem("11")












// **2. Defer**


func deff() {
    
    defer {
        print("2")
        print("the end")
    }
    print("1")
    return;
    
    print("3")
}


deff()





func loop() {
    for i in 1...5 {
        defer {
            print("Завершение итерации \(i)")
        }
        print("Итерация \(i)")
    }
}

loop()

func multiDeferExample() {
    print("Начало функции")
    
    defer {
        print("Первый defer")
    }
    
    defer {
        print("Второй defer")
    }
    
    print("Конец функции")
}

multiDeferExample()


func timeConsumingTask() {
    let startTime = Date()
    
    defer {
        let endTime = Date()
        let timeInterval = endTime.timeIntervalSince(startTime)
        print("Задача заняла \(timeInterval) секунд.")
    }
    
    // Какой-то длительный процесс
    for _ in 1...1_000_000 {
        _ = 1 + 1
    }
}

//timeConsumingTask()






// **3. Protocols**

protocol Vehicle {
    
    var numberOfWheels: Int { get }
    var fuelType: String { get }
    var isBrocken: Bool { get set }
    
    func description()
    func drive()
    func stop()
    
    func repair()
    
    func status()
}

protocol Trailer {
    var hasTrailer: Bool { get set }
}

extension Trailer {
    var hasTrailer: Bool {
        get {
            false
        }
        set { }
    }
}

class Car: Vehicle {
    var numberOfWheels: Int { 4 }
    var fuelType: String { "Бензин" }
    var isBrocken: Bool = false
    func drive() { print("Машина едет") }
    func stop() { print("Машина остановилась") }
    func repair()  { isBrocken = false }
    func description() {
        print("descr")
    }
}

class Bicycle: Vehicle {
    var numberOfWheels: Int { 2 }
    var fuelType: String { "Мускульная сила" }
    var isBrocken: Bool = false
    func drive() { print("Велосипед едет") }
    func stop() { print("Велосипед остановился") }
    func repair()  { isBrocken = false }
}

class Truck: Vehicle, Trailer {
    var numberOfWheels: Int { 6 }
    var fuelType: String { "Дизель" }
    var isBrocken: Bool = false
    func drive() { print("Грузовик едет") }
    func stop() { print("Грузовик остановился") }
    func repair()  { isBrocken = false }
}

// Создание экземпляров
let myCar = Car()
let myBike = Bicycle()
let myTruck = Truck()

// Вызов методов
myCar.drive()
myCar.stop()

myBike.drive()
myTruck.stop()

// Получение свойств
print("Мой автомобиль использует \(myCar.fuelType)")
print("Мой велосипед имеет \(myBike.numberOfWheels) колеса")


// Работа с массивом объектов протокола
var vehicles: [Vehicle] = [myCar, myBike, myTruck]
var vehiclesTemp: [Vehicle] = []
for vehicle in vehicles {
    var mutableVehicle = vehicle
    if vehicle.isBrocken {
        if vehicle is Trailer {
           //
        }
        mutableVehicle.repair()
        vehiclesTemp.append(mutableVehicle)
    }
}
vehicles = vehiclesTemp


// **4. Extensions **


extension Vehicle {
    func status() {
        print("Транспортное стердство сломано: \(isBrocken)")
    }
}

extension Vehicle {
    func description() {}
}



extension Bicycle {
    func status() {
        print("Никогда не ломается")
    }
}


myCar.status()
myBike.status()
myTruck.status()







// **5. Error Handling**

//protocol Error: Sendable { }

enum DataError: Error {
    case invalidData
    case dataNotFound
    case parsingError
}


func fetchData() throws -> Data {
    // do
    // do
    // do
    // do
    // do
    // do
    // do
    for _ in 0...10 {
        throw DataError.dataNotFound
    }
    // do
    // do
    // do
    // do
    // do
    // do
    return Data()
}

do {
    try fetchData()
} catch {
    print("\(error)")
}

do {
    let data = try fetchData()
    // Продолжите обработку данных
    // Продолжите обработку данных
    // Продолжите обработку данных
    // Продолжите обработку данных
} catch DataError.dataNotFound {
    print("Данные не найдены.")
} catch DataError.parsingError {
    print("Ошибка при разборе данных.")
} catch {
    print("Произошла неизвестная ошибка: \(error).")
}

let data: Data? = try? fetchData()

//if let data = data {
if let data = try? fetchData() {
    // У вас есть данные
} else {
    // Ошибка произошла
}







//: [Next](@next)
