//
//  Presenter.swift
//  simple-calc
//
//  Created by andrew mayer on 07.11.23.
//

import Foundation

final class Presenter {

    // MARK: - dependencies

    let brain: Brain
    var viewController: ViewController?

    // MARK: - life cycle

    init(brain: Brain, viewController: ViewController? = nil) {
        self.brain = brain
        self.viewController = viewController
        setupHandlers()
    }

    // MARK: - setups

    func setupHandlers() {
        brain.rezultHandler = { [weak self] rezult in
            self?.setupNumberToDisplay(rezult)
        }
    }

    // MARK: - handle vc events

    func digitPressed(_ text: Int) {
//        setupNumberToDisplay(Double(text))
        let digit = Double(text)
        let number = brain.digitPressed(digit)
        if brain.isDouble {
//            setupNumberToDisplay(digit)
        } else {
            if brain.operation != nil {
                clearDisplay()
                setupNumberToDisplay(number)
            } else {
                setupNumberToDisplay(number)
            }
        }
    }

    func operationPressed(_ operation: Operation) {
        brain.operationPressed(operation)
        switch operation {
        case .summ:
            break
        case .subtract:
            break
        case .multiply:
            break
        case .devide:
            break
        case .equal:
            break
        case .clear:
            brain.clear()
            clearDisplay()
        }
    }

    // MARK: - actions

    func setupNumberToDisplay(_ number: Double) {
        var format: String
        if brain.isDouble {
             format = "%f"
        } else {
            format = "%.0f"
        }
        viewController?.setupToDisplay(String(format: format, number))
    }

    func clearDisplay() {
        viewController?.setupToDisplay("0")
    }
}
