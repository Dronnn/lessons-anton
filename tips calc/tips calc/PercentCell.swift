//
//  PercentCell.swift
//  tips calc
//
//  Created by andrew mayer on 20.10.23.
//

import UIKit

class PercentCell: UITableViewCell {

    struct ViewModel {
        let text: String
        let isHidden: Bool
    }
    
    static let identifier = "PercentCell"
    
    // MARK: - otlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkmakrImageView: UIImageView!
    
    // MARK: - life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - config
    
    func config(with model: ViewModel) {
        titleLabel.text = model.text
        checkmakrImageView.isHidden = model.isHidden
    }

}
