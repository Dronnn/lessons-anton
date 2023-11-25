//
//  DashboardViewModel.swift
//  mvvm-demo
//
//  Created by andrew mayer on 15.11.23.
//

import Foundation

protocol DashboardViewModelProtocol {
    var callback: (() -> Void)? { get set }
}

class DashboardViewModel: DashboardViewModelProtocol {

    // MARK: - callbacks

    var callback: (() -> Void)?

}
