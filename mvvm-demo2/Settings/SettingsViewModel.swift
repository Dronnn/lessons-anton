//
//  SettingsViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 10.12.2023.
//

import Foundation

protocol SettingsViewModelProtocol {
    var callback: (() -> Void)? { get set }
}


class SettingsViewModel: SettingsViewModelProtocol {
    var callback: (() -> Void)?
}
