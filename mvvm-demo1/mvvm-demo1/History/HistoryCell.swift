//
//  HistoryCell.swift
//  mvvm-demo1
//
//  Created by andrew mayer on 30.11.23.
//

import UIKit
import SnapKit

class HistoryCell: UITableViewCell {

        // MARK: - life cycle

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCellView()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }

    // MARK: - setups

    private func setupCellView() {
        backgroundColor = .red
    }

    func setup(operation: Operation) {
        print(operation)
    }

}

