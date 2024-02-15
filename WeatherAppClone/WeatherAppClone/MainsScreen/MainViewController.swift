//
//  MainViewController.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 25.01.2024.
//



//- some : "{\"coord\":{\"lon\":37.6156,\"lat\":55.7522},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":1.09,\"feels_like\":-3.47,\"temp_min\":0.34,\"temp_max\":1.75,\"pressure\":1002,\"humidity\":91,\"sea_level\":1002,\"grnd_level\":983},\"visibility\":10000,\"wind\":{\"speed\":4.85,\"deg\":243,\"gust\":11.27},\"clouds\":{\"all\":100},\"dt\":1706805497,\"sys\":{\"type\":2,\"id\":2000314,\"country\":\"RU\",\"sunrise\":1706765092,\"sunset\":1706796063},\"timezone\":10800,\"id\":524901,\"name\":\"Moscow\",\"cod\":200}"

import UIKit

class MainViewController: UIViewController {
    
// MARK: Constants
    
    private enum Sections: Int, CaseIterable {
        case first
        case second
    }
    
    private enum Constants {
        static let firstRowInFirstSectionHeight: CGFloat = 56
        static let secondRowInFirstSectionHeight: CGFloat = 132
        static let heightForWeekSection: CGFloat = 44
    }
    
// MARK: Subviews
    
    private lazy var collectionCellsPerHour = {
        let collection = UICollectionView(frame: .zero)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private lazy var tableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
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
    

    let viewModel: MainViewModelProtocol = MainViewModel() // Переделать
    
// MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupSubviews()
        viewModel.getData() { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

// MARK: Setups
    private func setupSubviews() {
        
        view.addSubview(cityNameLabel)
        view.addSubview(cityDescriptionLabel)
        view.addSubview(mainTemperatureLabel)
        view.addSubview(wetherDescriptionLabel)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DayDescriptionTableViewCell.self, forCellReuseIdentifier: DayDescriptionTableViewCell.identifier)
        tableView.register(WeatherPerHourUITableViewCell.self, forCellReuseIdentifier: WeatherPerHourUITableViewCell.identifier)
        tableView.register(WeekDescriptionTableViewCell.self, forCellReuseIdentifier: WeekDescriptionTableViewCell.identifier)
        
    let hLabelAndlLabelStackView = UIStackView(arrangedSubviews: [hLabel, lLabel])
        hLabelAndlLabelStackView.axis = .horizontal
        hLabelAndlLabelStackView.distribution = .equalCentering
        hLabelAndlLabelStackView.spacing = 16
        hLabelAndlLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hLabelAndlLabelStackView)

        
        NSLayoutConstraint.activate([
            cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 116),
            
            cityDescriptionLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 2),
            cityDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainTemperatureLabel.topAnchor.constraint(equalTo: cityDescriptionLabel.bottomAnchor, constant: 8),
            mainTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTemperatureLabel.heightAnchor.constraint(equalToConstant: 44),
            
            wetherDescriptionLabel.topAnchor.constraint(equalTo: mainTemperatureLabel.bottomAnchor, constant: 8),
            wetherDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hLabelAndlLabelStackView.topAnchor.constraint(equalTo: wetherDescriptionLabel.bottomAnchor, constant: 2),
            hLabelAndlLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: hLabelAndlLabelStackView.bottomAnchor, constant: 64),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
   
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return Constants.firstRowInFirstSectionHeight
            } else {
                return Constants.secondRowInFirstSectionHeight
            }
        } else {
            return Constants.heightForWeekSection
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Hourly Forecast"
        } else {
            return "10-day ForceCast"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            2
        } else {
            7
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.section == 0 {
//            return firstRowFirstSectionCell(tableView, cellForRowAt: indexPath)
//        } else if indexPath.section == 1 {
//            return secondSectionCell(tableView, cellForRowAt: indexPath)
//        } else {
//            return UITableViewCell()
//        }
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return firstRowFirstSectionCell(tableView, cellForRowAt: indexPath)
            } else {
                return secondRowFirstSectionCell(tableView, cellForRowAt: indexPath)
            }
        } else {
            return secondSectionCell(tableView, cellForRowAt: indexPath)
        }
    }
    
    
}

extension MainViewController {
    
    func firstRowFirstSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: DayDescriptionTableViewCell.identifier, for: indexPath) as?        DayDescriptionTableViewCell
        else {
            return UITableViewCell()
        }
        cell.separatorInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 36)
        return cell
    }
    
    func secondRowFirstSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: WeatherPerHourUITableViewCell.identifier, for: indexPath) as?        WeatherPerHourUITableViewCell
        else {
            return UITableViewCell()
        }
        cell.separatorInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 36)
        return cell
    }
    
    
    func secondSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: WeekDescriptionTableViewCell.identifier, for: indexPath) as?        WeekDescriptionTableViewCell
        else {
            return UITableViewCell()
        }
        cell.separatorInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 36)
        return cell
    }
    
    private func setupCollectionView() {
       
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}


    
    

