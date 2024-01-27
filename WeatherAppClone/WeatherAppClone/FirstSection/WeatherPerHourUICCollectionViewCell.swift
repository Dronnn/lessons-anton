//
//  WeatherPerHourUITableViewCell.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 25.01.2024.
//

import UIKit

class WeatherPerHourUITableViewCell: UITableViewCell {
    
// MARK: Subviews
    private lazy var hourlyWeatherCollectionView = {
        let collection = UICollectionView(frame: .zero)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .green
        return collection
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
        contentView.addSubview(hourlyWeatherCollectionView)
        hourlyWeatherCollectionView.dataSource = self
        hourlyWeatherCollectionView.delegate = self
        hourlyWeatherCollectionView.register(HourCollectionViewCell.self, forCellWithReuseIdentifier: HourCollectionViewCell.identifier)
        
        NSLayoutConstraint.activate([
            hourlyWeatherCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hourlyWeatherCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hourlyWeatherCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hourlyWeatherCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}


extension WeatherPerHourUITableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourCollectionViewCell.identifier, for: indexPath) as? HourCollectionViewCell
//        else {
//            return UICollectionViewCell()
//        }
        let cell = UICollectionViewCell()
        cell.backgroundColor = .green
        return cell
    }
    

   


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        24
    }

}

extension WeatherPerHourUITableViewCell: UICollectionViewDelegate {
    
}

