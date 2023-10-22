//
//  PercentageTableViewCell.swift
//  clone_tips_calc_app
//
//  Created by Eliseev Anton on 21.10.2023.
//

import UIKit

class PercentageTableViewCell: UITableViewCell {
    
    
    struct PecentsModel {
        let number: String
        let isHidden: Bool
    }

    static let identifier = "PercentageTableViewCell"
    
// MARK: - OUTLETS
    
    @IBOutlet weak var percentNumberLabel: UILabel!
    
    @IBOutlet weak var isHiddenCheckMarkLabel: UIImageView!
    
// MARK: - LIFE CYCLE
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
// MARK: - CONFIG
    
    func config(with model: PecentsModel) {
        percentNumberLabel.text = model.number
        isHiddenCheckMarkLabel.isHidden = model.isHidden
    }

}
