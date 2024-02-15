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
        label.text = "Sunday"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 16)
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
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 16)
        return label
    }()
    
    
    
    
    
    
    
    
    private lazy var dayTempLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "33"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 16)
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
            currentDayLabel.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 16),

            
            weatherImage.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: currentDayLabel.trailingAnchor, constant: 24),
            weatherImage.heightAnchor.constraint(equalToConstant: 16),
            weatherImage.widthAnchor.constraint(equalToConstant: 16),
            
            nightTempLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            nightTempLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 24),

            
            dayTempLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            dayTempLabel.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -24),

            
        ])
    }

    
    func setupLabels(minTemp: Double, maxTemp: Double, image: String) {
        weatherImage.image = UIImage(systemName: image)
        
    }
}
