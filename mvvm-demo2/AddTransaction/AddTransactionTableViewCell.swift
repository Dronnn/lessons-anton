//
//  AddTransactionTableViewCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 30.12.2023.
//

import UIKit

class AddTransactionTableViewCell: UITableViewCell {
    
    // MARK: Subviews
    
    private lazy var summText = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Сумма"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var nameText = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Название"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    

// MARK: Life Cycle
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
        
    required init?(coder: NSCoder) {
            super.init(coder: coder)
        setupSubViews()
    }
    
    
    // MARK: Setups
    
    private func setupSubViews() {
        
    }

}
