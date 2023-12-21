//
//  FirstSectionSettingsCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 10.12.2023.
//

import UIKit

class FirstSectionSettingsCell: UITableViewCell {
    
// MARK: Subviews
    private lazy var cellView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Margo Dev Apple"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var professionLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Apple Developer"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var photoImage = {
       let image = UIImageView(image: UIImage(named: "photo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 25
        return image
    }()

// MARK: Life Cycle
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCellView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupCellView()
        }
    
    // MARK: Setups
    private func setupCellView() {
        addSubview(cellView)
        cellView.addSubview(nameLabel)
        cellView.addSubview(professionLabel)
        cellView.addSubview(photoImage)
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellView.topAnchor.constraint(equalTo: self.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            photoImage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            photoImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 25),
            photoImage.heightAnchor.constraint(equalToConstant: 55),
            photoImage.widthAnchor.constraint(equalToConstant: 55),
            
            nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: photoImage.trailingAnchor, constant: 25),
            
            professionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            professionLabel.leadingAnchor.constraint(equalTo: photoImage.trailingAnchor, constant: 25)
        ])
    }
    
}