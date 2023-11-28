//
//  DashBoardViewModel.swift
//  mvvm-demo1
//
//  Created by Eliseev Anton on 20.11.2023.
//

import Foundation

protocol DashboardViewModelProtocol {
    var callback: (() -> Void)? { get set}
}

class DashBoardViewModel: DashboardViewModelProtocol {
    
    // MARK: callbacks
    
    var callback: (() -> Void)?
}
