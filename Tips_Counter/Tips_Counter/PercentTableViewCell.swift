//
//  PecentTableViewCell.swift
//  Tips_Counter
//
//  Created by Eliseev Anton on 31.10.2023.
//

import UIKit

class PercentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var checkedImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func confug(title: String, isSelected: Bool) {
        percentLabel.text = title
        checkedImageView.isHidden = !isSelected
    }
    
}
