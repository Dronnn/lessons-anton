//
//  SettingsViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 10.12.2023.
//

import Foundation

protocol SettingsViewModelProtocol {
    var callback: (() -> Void)? { get set }
    func getModel(for section: SettingsViewController.Sections, with index: Int) -> CellModelProtocol
}

protocol CellModelProtocol {
    
}

class SettingsViewModel: SettingsViewModelProtocol {
    
    struct DataType {
        let title: String
        let subTitle: String?
        let date: Date?
        let pictureName: String
        let isSwitchable: Bool
    }
    
    var callback: (() -> Void)?
    
    var dataModels: [DataType] = [
        .init(title: "Maria", subTitle: "Apple Developer", date: nil, pictureName: "photo", isSwitchable: false),
        
        .init(title: "Account", subTitle: nil, date: nil, pictureName: "lock", isSwitchable: false),
        .init(title: "Currency", subTitle: nil, date: nil, pictureName: "creditcard.viewfinder", isSwitchable: false),
        
        .init(title: "Application Lock", subTitle: nil, date: nil, pictureName: "faceid", isSwitchable: false),
        .init(title: "Nitification", subTitle: nil, date: nil, pictureName: "bell", isSwitchable: false),
        
        .init(title: "Onboarding", subTitle: nil, date: nil, pictureName: "arrow.triangle.2.circlepath.doc.on.clipboard", isSwitchable: false),
        .init(title: "FAQ / Contacts", subTitle: nil, date: nil, pictureName: "questionmark.app", isSwitchable: false),
        .init(title: "Export Transactions", subTitle: nil, date: nil, pictureName: "arrow.up.doc", isSwitchable: false),
        .init(title: "About", subTitle: nil, date: nil, pictureName: "list.bullet.rectangle.portrait", isSwitchable: false),
    ]
    
    
    func getModel(for section: SettingsViewController.Sections, with index: Int) -> CellModelProtocol {
        switch section {
        case .second:
            SecondSectionCell.Model(picture: dataModels[index].pictureName, title: dataModels[index].title)
        case .third:
            ThirdSectionCell.Model(image: dataModels[index].pictureName, title: dataModels[index].title, date: nil)
        case .fourth:
            FourthSectionCell.Model(image: dataModels[index].pictureName, title: dataModels[index].title)
        case .first:
            FirstSectionSettingsCell.Model(name: dataModels[index].title, profession: dataModels[index].subTitle ?? "", image: dataModels[index].pictureName)
        }
        
    }
}




