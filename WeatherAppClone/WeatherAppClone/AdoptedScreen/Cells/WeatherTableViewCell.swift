//
//  WeatherTableViewCell.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 06.02.2024.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    private lazy var idLabel = {
        let lab = UILabel(frame: .zero)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "1"
        return lab
    }()
    
    private lazy var mainLabel = {
        let lab = UILabel(frame: .zero)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "main"
        return lab
    }()
    
    private lazy var descrLabel = {
        let lab = UILabel(frame: .zero)
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.text = "Description"
        return lab
    }()
    
    private lazy var iconLabel = {
        let icon = UIImageView(image: UIImage(systemName: "plus"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setupViews()
    }
    
    
    func setupViews() {
        contentView.addSubview(idLabel)
        contentView.addSubview(mainLabel)
        contentView.addSubview(descrLabel)
        contentView.addSubview(iconLabel)
        
        
        NSLayoutConstraint.activate([
            iconLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            idLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 16),
            idLabel.bottomAnchor.constraint(equalTo: mainLabel.topAnchor, constant: -8),
            
            mainLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 16),
            mainLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            descrLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 16),
            descrLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 8),
            
            
            
        ])
    }
    
    func setupMainLabels(id: String, main: String) {
        idLabel.text = id
        mainLabel.text = main
//        descrLabel.text = desc
//        iconLabel.image = UIImage(systemName: icon)
    }
}
