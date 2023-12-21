//
//  DashboardViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import Foundation

protocol DashboardViewModelProtocol {
    var callback: (() -> Void)? { get set }
}

class DashboardViewModel: DashboardViewModelProtocol {
    var callback: (() -> Void)?
}
