//
//  ViewController.swift
//  WeatherClone
//
//  Created by Eliseev Anton on 25.01.2024.
//

import UIKit

class MainViewController: UIViewController {
// MARK: Subviews
    private lazy var cityNameLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Washington"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 44)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cityDescriptionLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Province"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainTemperatureLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 56)
        label.text = "25"
        return label
    }()
    
    private lazy var wetherDescriptionLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cloudy"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 24)
        return label
    }()
    
    private lazy var hLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "H:10"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 24)
        return label
    }()
    
    private lazy var lLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "L:25"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 24)
        return label
    }()
    
    
    
// MARK: Life Cycle
override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupSubviews()
    }

// MARK: Setups
    private func setupSubviews() {
        
        view.addSubview(cityNameLabel)
        view.addSubview(cityDescriptionLabel)
        view.addSubview(mainTemperatureLabel)
        view.addSubview(wetherDescriptionLabel)
        
    let hLabelAndlLabelStackView = UIStackView(arrangedSubviews: [hLabel, lLabel])
        hLabelAndlLabelStackView.axis = .horizontal
        hLabelAndlLabelStackView.distribution = .equalCentering
        hLabelAndlLabelStackView.spacing = 16
        hLabelAndlLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hLabelAndlLabelStackView)

        
        NSLayoutConstraint.activate([
            cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 116),
            
            cityDescriptionLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 8),
            cityDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainTemperatureLabel.topAnchor.constraint(equalTo: cityDescriptionLabel.bottomAnchor, constant: 8),
            mainTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTemperatureLabel.heightAnchor.constraint(equalToConstant: 44),
            
            wetherDescriptionLabel.topAnchor.constraint(equalTo: mainTemperatureLabel.bottomAnchor, constant: 8),
            wetherDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hLabelAndlLabelStackView.topAnchor.constraint(equalTo: wetherDescriptionLabel.bottomAnchor, constant: 8),
            hLabelAndlLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ])
    }
}

