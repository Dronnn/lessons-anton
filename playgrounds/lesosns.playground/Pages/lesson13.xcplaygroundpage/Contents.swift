//: [Previous](@previous)

import Foundation

var greeting = "Hello, singleton"

class Singleton {

    static let shared = Singleton()
    
    private init() { }
    
    func doSomething() {
        print("Doing something...")
    }
}

Singleton.shared.doSomething()


//: [Next](@next)
