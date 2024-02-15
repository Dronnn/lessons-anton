//
//  TempTableViewCell.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 06.02.2024.
//

import UIKit

class TempTableViewCell: UITableViewCell {
    
    // MARK: Subviews
    
    private lazy var tempLabel = {
        let label = UILabel(frame: .zero)
        label.text = "mainTemp"
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var feelsLikeLabel = {
        let label = UILabel(frame: .zero)
        label.text = "feelsLike"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minTempLabel = {
        let label = UILabel(frame: .zero)
        label.text = "min"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTempLabel = {
        let label = UILabel(frame: .zero)
        label.text = "max"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pressureLabel = {
        let label = UILabel(frame: .zero)
        label.text = "press"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var humidityLabel = {
        let label = UILabel(frame: .zero)
        label.text = "humid"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seaLevelLabel = {
        let label = UILabel(frame: .zero)
        label.text = "sea"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var grndLabel = {
        let label = UILabel(frame: .zero)
        label.text = "grnd"
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
    
    
    func setupViews() {
        contentView.addSubview(tempLabel)
        contentView.addSubview(feelsLikeLabel)
        contentView.addSubview(minTempLabel)
        contentView.addSubview(maxTempLabel)
        contentView.addSubview(humidityLabel)
        contentView.addSubview(seaLevelLabel)
        contentView.addSubview(grndLabel)
        contentView.addSubview(pressureLabel)
        
        NSLayoutConstraint.activate([
            tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tempLabel.heightAnchor.constraint(equalToConstant: 44),
            tempLabel.widthAnchor.constraint(equalToConstant: 88),
            
            feelsLikeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 8),
            feelsLikeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 8),
            
            minTempLabel.trailingAnchor.constraint(equalTo: tempLabel.leadingAnchor, constant: -56),
            minTempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            maxTempLabel.trailingAnchor.constraint(equalTo: tempLabel.leadingAnchor, constant: -56),
            maxTempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            maxTempLabel.heightAnchor.constraint(equalToConstant: 44),
            maxTempLabel.widthAnchor.constraint(equalToConstant: 44),
            
            humidityLabel.trailingAnchor.constraint(equalTo: tempLabel.leadingAnchor, constant: -56),
            humidityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            
            
            seaLevelLabel.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 56),
            seaLevelLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            grndLabel.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 56),
            grndLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            pressureLabel.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor, constant: 56),
            pressureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
    }
    
    func setupTemp(temp: Double, feels: String, min: String, max: String, pressure: String, humidity: String, sea: String, grnd: String) {
        tempLabel.text = "\(temp)"
        feelsLikeLabel.text = feels
        minTempLabel.text = min
        maxTempLabel.text = max
        pressureLabel.text = pressure
        humidityLabel.text = humidity
        seaLevelLabel.text = sea
        grndLabel.text = grnd
    }
}
