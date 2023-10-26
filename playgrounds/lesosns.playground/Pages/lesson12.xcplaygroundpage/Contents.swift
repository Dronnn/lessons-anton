//: [Previous](@previous)

import Foundation

var greeting = "Hello, delegate"

protocol RefuelServiceDelegate: AnyObject {
    func refuel(amount: Int)
}

class RefuelService {
    weak var delegate: RefuelServiceDelegate?
    
    func startRefueling() {
        delegate?.refuel(amount: 50)
    }
}

class Car: RefuelServiceDelegate {
    var fuel: Int = 0
    
    func refuel(amount: Int) {
        fuel += amount
        print("Car refueled with \(amount) liters. Total fuel now: \(fuel) liters.")
    }
}

class Motorcycle: RefuelServiceDelegate {
    var fuel: Int = 0
    
    func refuel(amount: Int) {
        fuel += amount
        print("Motorcycle refueled with \(amount) liters. Total fuel now: \(fuel) liters.")
    }
}

class Track: RefuelServiceDelegate {
    var fuel1: Int = 0
    var fuel2: Int = 0
    
    func refuel(amount: Int) {
        fuel1 = amount * 0.3
        fuel2 = amount * 0.7
    }
    
}

let myCar = Car()
let refuelService = RefuelService()

print(myCar.fuel)

refuelService.delegate = myCar
refuelService.startRefueling()

print(myCar.fuel)


//: [Next](@next)
