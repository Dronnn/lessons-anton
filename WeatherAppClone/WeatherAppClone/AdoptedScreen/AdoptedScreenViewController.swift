//
//  AdoptedScreenViewController.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 04.02.2024.
//

import UIKit

class AdoptedScreenViewController: UIViewController {

    let viewModel: AdoptedScreenViewModelProtocol = AdoptedScreenViewModel() 
  
    
    private lazy var tableVw = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .green
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupTw()
        viewModel.getData { [weak self ] _ in
            DispatchQueue.main.async {
                self?.tableVw.reloadData()
            }
        }
    }

    
    private func setupTw() {
        view.addSubview(tableVw)
        tableVw.dataSource = self
        tableVw.delegate = self
        
        tableVw.register(CoordTableViewCell.self, forCellReuseIdentifier: CoordTableViewCell.identifier)
        tableVw.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableVw.register(TempTableViewCell.self, forCellReuseIdentifier: TempTableViewCell.identifier)
        
        NSLayoutConstraint.activate([
            tableVw.topAnchor.constraint(equalTo: view.topAnchor),
            tableVw.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableVw.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableVw.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension AdoptedScreenViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return zeroRow(tableView, cellForRowAt: indexPath)
        } else if indexPath.row == 1 {
            return firstRow(tableView, cellForRowAt: indexPath)
        } else if indexPath.row == 2 {
            return secondRow(tableView, cellForRowAt: indexPath)
        } else {
            return UITableViewCell()
        }
    }
    
    
}

extension AdoptedScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 88
        } else if indexPath.row == 2 {
            return 120
        } else {
            return 44
        }
    }
}


extension AdoptedScreenViewController {
    
    func zeroRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: CoordTableViewCell.identifier, for: indexPath) as? CoordTableViewCell
            
        else {
            return UITableViewCell()
        }
       
        return cell
    }
    
    func firstRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell
            
        else {
            return UITableViewCell()
        }
        return cell
    }
    
    func secondRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: TempTableViewCell.identifier, for: indexPath) as? TempTableViewCell
            
        else {
            return UITableViewCell()
        }
        cell.setupTemp(
            temp: viewModel.weatherData.main.temp,
            feels: "\(viewModel.weatherData.main.feelsLike)",
            min: "\(viewModel.weatherData.main.tempMin)",
            max: "\(viewModel.weatherData.main.tempMax)",
            pressure: "\(viewModel.weatherData.main.pressure)",
            humidity: "\(viewModel.weatherData.main.humidity)",
            sea: "\(viewModel.weatherData.main.seaLevel)",
            grnd: "\(viewModel.weatherData.main.grndLevel)"
        )
        return cell
    }
}
