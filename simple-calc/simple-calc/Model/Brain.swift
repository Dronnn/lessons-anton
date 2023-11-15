//
//  Brain.swift
//  simple-calc
//
//  Created by andrew mayer on 07.11.23.
//

import Foundation

final class Brain {
    
    private var operand1: Double?
    private var operand2: Double?
    private(set) var operation: Operation?
    var isDouble: Bool = false

    private var rezult: Double? {
        didSet {
            guard let rezult else { return }
            rezultHandler?(rezult)
        }
    }

    var rezultHandler: ((Double) -> Void)?

    func digitPressed(_ digit: Double) -> Double {
        if operation == nil {
            operand1 = (operand1 ?? 0) * 10 + digit
            return operand1 ?? 0.0
        } else {
            operand2 = (operand2 ?? 0) * 10 + digit
            return operand2 ?? 0.0
        }
    }

    func operationPressed(_ operation: Operation) {
        if operation == .equal {
             rezult = calculate()
        } else {
            self.operation = operation
        }
    }

    private func calculate() -> Double {
        guard
            let operand1,
            let operand2
        else {
            return 0
        }
        switch operation {
        case .summ:
            return operand1 + operand2
        case .subtract:
            return operand1 - operand2
        case .multiply:
            return operand1 * operand2
        case .devide:
            if operand2 != 0 { return 0 }
            return operand1 / operand2
        default: return 0
        }
    }

    func clear() {
        operand1 = nil
        operand2 = nil
        operation = nil
    }
}
