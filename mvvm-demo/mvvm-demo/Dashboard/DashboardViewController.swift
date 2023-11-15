//
//  DashboardViewController.swift
//  mvvm-demo
//
//  Created by andrew mayer on 15.11.23.
//

import UIKit

class DashboardViewController: UIViewController {

    // MARK: - subviews

    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .blue
        return table
    }()

    // MARK: - properties

    private let viewModel: DashboardViewModel

    // MARK: - life cycle

    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        bind()
        setupTableView()
    }

    // MARK: - bind

    private func bind() {
        viewModel.callback = {

        }
    }

    // MARK: - setup

    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
