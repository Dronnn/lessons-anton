//
//  HistoryViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

class HistoryViewController: UIViewController {
    
// MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .blue
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
// MARK: Properties
    private var viewModel: HistoryViewModelProtocol
    
    
// MARK: Life Cycle
    init(viewModel: HistoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
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
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}

extension HistoryViewController: UITableViewDelegate {
    
}
