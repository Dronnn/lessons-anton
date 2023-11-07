//
//  Configurator.swift
//  simple-calc
//
//  Created by andrew mayer on 07.11.23.
//

import Foundation

class Configurator {

    static func buid() -> ViewController {
        let brain = Brain()
        let presenter = Presenter(brain: brain)
        let viewController = ViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }

}
