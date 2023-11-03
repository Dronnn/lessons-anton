//
//  DataManager.swift
//  Tips_Counter
//
//  Created by Eliseev Anton on 01.11.2023.
//

import Foundation


class DataManager {
    
// MARK: - (INSTANCES)
    static let shared = DataManager()
    private init() {}
    
// MARK: - DATA
        var selectedCellNumber = IndexPath(row: 0, section: 0)
    
// MARK: TYPES
    
    enum Keys: String {
        case selectedPercent
        case array
    }
    
    
    // MARK: - TEXT
    
    var selectedPercent: Int {
        get {
            UserDefaults.standard.value(forKey: Keys.selectedPercent.rawValue) as? Int ?? 10
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.selectedPercent.rawValue)
        }
    }
    
    var percentagesArray: [Int] {
        get {
            UserDefaults.standard.value(forKey: Keys.array.rawValue) as? [Int] ?? []
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.array.rawValue)
        }
        
    }
    
    
// MARK: METHODS
    
    func setupDefaultPercentages() {
        guard UserDefaults.standard.value(forKey: Keys.array.rawValue) == nil else { return }
        UserDefaults.standard.setValue([10, 15, 20, 25, 30], forKey: Keys.array.rawValue)
    }
}
