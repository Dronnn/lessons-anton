//
//  CategoriesViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 06.01.2024.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    enum Sections: Int, CaseIterable {
        case first
        case second
        case third
        case fourth
        case fifth
        case sixth
        case seventh
        case eighth
        case ninth
    }
    
//    let categorySectionsData: [String:[String]] = [
//        "Auto & Transport":[
//            "Public Transportation",
//            "Taxi"
//        ],
//        "Bills & Utilites":[
//            "Mobile Phone"
//        ],
//        "Entertainment":[
//            "Movies & DVDs"
//        ],
//        "Fees & Charges":[
//            "Bank Fee",
//            "Finance Charge"
//        ], 
//        "Food & Dining":[
//            "Groceries",
//            "Restaurants"
//        ], 
//        "Home":[
//            "Rent",
//            "Home Supplies"
//        ], 
//        "Income":[
//            "Paycheque"
//        ],
//        "Shopping":[
//            "Software"
//        ],
//        "Transfer":[
//            "Credit Card Payment"
//        ],
//    ]
    
//    let categoriesPictures: [String:[String]] = [
//        "car":[
//            "bus.fill",
//            "car.front.waves.up"
//        ],
//        "list.clipboard":[
//            "iphone.gen1"
//        ],
//        "film":[
//            "film"
//        ],
//        "creditcard.and.123":[
//            "creditcard",
//            "creditcard"
//        ],
//        "cart":[
//            "basket",
//            "fork.knife"
//        ],
//        "house":[
//            "house.lodge",
//            "lightbulb.led"
//        ],
//        "dollarsign":[
//            "dollarsign"
//        ],
//        "giftcard":[
//            "gamecontroller"
//        ],
//        "arrow.left.arrow.right":[
//            "arrow.left.arrow.right"
//        ],
//    ]
    
    // MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = UIColor(named: "bgColor")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupTableView()
    }
    
    // MARK: Setups
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CategoriesViewCell.self, forCellReuseIdentifier: CategoriesViewCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
 
}


extension CategoriesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard
            let sectionName = Sections(rawValue: section)
        else {
            fatalError()
        }
        switch sectionName {
        case .first:
            return 2
        case .second:
            return 1
        case .third:
            return 1
        case .fourth:
            return 2
        case .fifth:
            return 2
        case .sixth:
            return 2
        case .seventh:
            return 1
        case .eighth:
            return 1
        case .ninth:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return simpleCell(tableView, cellForRowAt: indexPath)
    }
}

extension CategoriesViewController: UITableViewDelegate {
    
   
}

extension CategoriesViewController {
    
    func simpleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesViewCell.identifier, for: indexPath) as? CategoriesViewCell
    else {
        return UITableViewCell()
    }
        cell.separatorInset = UIEdgeInsets(
            top: 0,
            left: 70,
            bottom: 0,
            right: 0
        )
               
        return cell
    }
}
