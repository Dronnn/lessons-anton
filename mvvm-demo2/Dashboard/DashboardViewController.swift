//
//  ViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var mockData: [TransactionModel] = [
        TransactionModel(title: "qqq", amount: 123.0, category: Category(picture: "pic", title: "hhh1"), date: Date(), note: "123"),
        TransactionModel(title: "vwv", amount: 223, category: Category(picture: "hhh", title: "hhh2"), date: Date(), note: "223"),
        TransactionModel(title: "jjg", amount: 665, category: Category(picture: "nnn", title: "hhh3"), date: Date(), note: "323"),
        TransactionModel(title: "lll", amount: 456, category: Category(picture: "ggg", title: "hhh5"), date: Date(), note: "423"),
    ]
    
    // MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    // MARK: Sections
    private enum Sections: Int, CaseIterable {
        case info
        case recent
    }
    
    // MARK: Constants
    private enum Constants {
        static let infoCellHeight: CGFloat = 180.0
        static let historyCellHeight: CGFloat = 90.0
    }
    
    // MARK: Properties
    private var viewModel: DashboardViewModelProtocol

    
    // MARK: Life Cycle
    
    init(viewModel: DashboardViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Dashboard"
        bind()
        setupTableView()
    }
    
    // MARK: Bind
    private func bind() {
        viewModel.callback = {
            
        }
    }


    // MARK: Setups
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        tableView.register(RecentCell.self, forCellReuseIdentifier: RecentCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}


extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard
            let sectionName = Sections(rawValue: indexPath.section)
        else {
            fatalError()
        }
        switch sectionName {
        case.info:
            return Constants.infoCellHeight
        case.recent:
            return Constants.historyCellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        detailsVC.transactionModel = mockData[indexPath.row]
        detailsVC.removeClosure = { [weak self ] in
            self?.mockData.remove(at: indexPath.row)
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension DashboardViewController: UITableViewDataSource {
    
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
            
        case .info:
            return 1
        case .recent:
            return mockData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let sectionName = Sections(rawValue: indexPath.section)
        else {
            fatalError()
        }
        switch sectionName {
            
        case .info:
            return firstSectionCell(tableView, cellForRowAt: indexPath)
        case .recent:
            return secondSectionCell(tableView, cellForRowAt: indexPath)
        }
        
    }
}
    
    extension DashboardViewController {
        
        private func firstSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier, for: indexPath) as? InfoCell
            else {
                return UITableViewCell()
            }
            return cell
        }
        
        private func secondSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: RecentCell.identifier, for: indexPath) as? RecentCell
            else {
                return UITableViewCell()
            }
            cell.setupModel(transaction: mockData[indexPath.row])
            return cell
        }
    }
