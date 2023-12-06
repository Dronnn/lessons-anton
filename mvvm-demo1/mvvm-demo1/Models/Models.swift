//
//  Models.swift
//  mvvm-demo1
//
//  Created by andrew mayer on 04.12.23.
//

import Foundation

struct Operation {
    let title: String
    let note: String
    let category: Category
    let date: Date
    let amount: Double
}

struct Category {
    let title: String
}
