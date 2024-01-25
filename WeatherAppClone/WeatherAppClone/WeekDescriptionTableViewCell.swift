//
//  WeekDescriptionTableViewCell.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 25.01.2024.
//

import UIKit

class WeekDescriptionTableViewCell: UITableViewCell {

// MARK: Subviews
    private lazy var blurView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var currentDayLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Today"
        return label
    }()
    
    private lazy var weatherImage = {
        let image = UIImageView(image: UIImage(systemName: "plus"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nightTempLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "22"
        return label
    }()
    
    
    
    
    
    
    
    
    private lazy var dayTempLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "33"
        return label
    }()
    
        

// MARK: Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
        
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
        
// MARK: Setups
    private func setupViews() {
        contentView.addSubview(blurView)
        
        blurView.addSubview(currentDayLabel)
        blurView.addSubview(weatherImage)
        blurView.addSubview(nightTempLabel)
        blurView.addSubview(dayTempLabel)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: contentView.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            blurView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            currentDayLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            currentDayLabel.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 8),
            
            weatherImage.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: currentDayLabel.trailingAnchor, constant: 16),
            
            nightTempLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            nightTempLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 16),
            
            dayTempLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            dayTempLabel.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -8)
            
            
        ])
    }

}
