//
//  Presenter.swift
//  simple-calc
//
//  Created by andrew mayer on 07.11.23.
//

import Foundation

final class Presenter {

    let brain: Brain

    var viewController: ViewController?

    init(brain: Brain, viewController: ViewController? = nil) {
        self.brain = brain
        self.viewController = viewController
    }
}
