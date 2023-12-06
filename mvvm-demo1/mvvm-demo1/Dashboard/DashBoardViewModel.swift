//
//  DashBoardViewModel.swift
//  mvvm-demo1
//
//  Created by Eliseev Anton on 20.11.2023.
//

import Foundation

protocol DashboardViewModelProtocol {
    var operations: [Operation] { get set}
    var callback: (() -> Void)? { get set}
}

class DashBoardViewModel: DashboardViewModelProtocol {
    
    // MARK: - properties

    var operations: [Operation] = [
        Operation(
            title: "qqq",
            note: "www",
            category: Category(title: "eee"),
            date: Date(),
            amount: 123
        ),
        Operation(
            title: "aaa",
            note: "sss",
            category: Category(title: "ddd"),
            date: Date(),
            amount: 321
        )
    ]

    // MARK: callbacks
    
    var callback: (() -> Void)?
}
