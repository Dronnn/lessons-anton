//
//  CoordTableViewCell.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 06.02.2024.
//

import UIKit

class CoordTableViewCell: UITableViewCell {
    
//    \"coord\":{\"lon\":37.6156,\"lat\":55.7522}
    
// MARK: Subviews
    private lazy var lonLabel = {
        let lon = UILabel(frame: .zero)
        lon.text = "lon:37.6156"
        lon.translatesAutoresizingMaskIntoConstraints = false
        return lon
    }()

    private lazy var latLabel = {
        let lat = UILabel(frame: .zero)
        lat.text = "lat:55.7522"
        lat.translatesAutoresizingMaskIntoConstraints = false
        return lat
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setupViews()
    }
    
    
    private func setupViews() {
        contentView.addSubview(lonLabel)
        contentView.addSubview(latLabel)
        
        NSLayoutConstraint.activate([
            lonLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            lonLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            latLabel.leadingAnchor.constraint(equalTo: lonLabel.trailingAnchor, constant: 140),
            latLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
 
            
        ])
    }
    
    func setupLonLatLabels(lon: String, lat: String) {
        lonLabel.text = lon
        latLabel.text = lat
    }
}
