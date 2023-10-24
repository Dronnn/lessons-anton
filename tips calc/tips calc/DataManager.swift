//
//  DataManager.swift
//  tips calc
//
//  Created by andrew mayer on 24.10.23.
//

import Foundation

class DataManager {
    
    // MARK: - types
    
    enum Keys: String {
        case selectedPercent
        case array
    }
    
    // MARK: - instances
    
    static let shared = DataManager()
    
    private init() {}
    
    // MARK: - text
    
    var selectedPercent: Int {
        get {
            UserDefaults.standard.value(forKey: Keys.selectedPercent.rawValue) as? Int ?? 10
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.selectedPercent.rawValue)
        }
    }
    
    var percentsages: [Int] {
        UserDefaults.standard.value(forKey: Keys.array.rawValue) as? [Int] ?? []
    }
    
    // MARK: - methods
    
    func setupDefaultPersentsges() {
        guard UserDefaults.standard.value(forKey: Keys.array.rawValue) == nil else { return }
        UserDefaults.standard.setValue([11, 22, 33, 44, 55, 66, 77], forKey: Keys.array.rawValue)
    }
}
