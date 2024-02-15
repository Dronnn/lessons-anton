//
//  DayDescriptionTableViewCell.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 25.01.2024.
//

import UIKit

class DayDescriptionTableViewCell: UITableViewCell {
    
// MARK: Subviews
   
    private lazy var blurView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 30, alpha: 30)
        return view
    }()
    
    private lazy var weatherDescriptionTextLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Weather description"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

// MARK: Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setupViews()
    }
    
// MARK: Setups
    
    private func setupViews() {
        contentView.addSubview(blurView)
        blurView.addSubview(weatherDescriptionTextLabel)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: contentView.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            blurView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            weatherDescriptionTextLabel.topAnchor.constraint(equalTo: blurView.topAnchor),
            weatherDescriptionTextLabel.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
            weatherDescriptionTextLabel.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            weatherDescriptionTextLabel.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            
        ])
    }
}


