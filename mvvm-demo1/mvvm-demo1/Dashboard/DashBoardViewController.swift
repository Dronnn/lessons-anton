//
//  DashBoardViewController.swift
//  mvvm-demo1
//
//  Created by Eliseev Anton on 20.11.2023.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    // MARK: - sections

    private enum Sections: Int, CaseIterable {
        case info
        case recent
    }

    // MARK: - Const

    private enum Const { // namespace
        static let infoCellHeigh: CGFloat = 180.0
        static let historyCellHeigh: CGFloat = 44.0
    }

    // MARK: subviews
    
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
        
    // MARK: properties
    
    private var viewModel: DashboardViewModelProtocol
    
    // MARK: life cycle

    init(viewModel: DashBoardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backCol

        title = "Dashboard"
        bind()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .always
    }

    // MARK: BIND
    
    private func bind() {
        viewModel.callback = {
            //
        }
    }
    
    // MARK: setup
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(
            InfoCell.self,
            forCellReuseIdentifier: InfoCell.identifier
        )
        tableView.register(
            HistoryCell.self,
            forCellReuseIdentifier: HistoryCell.identifier
        )
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension DashBoardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard
            let sectionName = Sections(rawValue: indexPath.section)
        else {
            fatalError()
        }
        switch sectionName {
        case .info:
            return Const.infoCellHeigh
        case .recent:
            return Const.historyCellHeigh
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.opetation = viewModel.operations[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension DashBoardViewController: UITableViewDataSource {

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
            return viewModel.operations.count
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
            return sectionFirstCell(tableView, cellForRowAt: indexPath)
        case .recent:
            return sectionSecondCell(tableView, cellForRowAt: indexPath)
        }
    }
}

extension DashBoardViewController {

    private func sectionFirstCell(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    )  -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: InfoCell.identifier,
                for: indexPath
            ) as? InfoCell
        else {
            return UITableViewCell()
        }
        return cell
    }

    private func sectionSecondCell(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    )  -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HistoryCell.identifier,
                for: indexPath
            ) as? HistoryCell
        else {
            return UITableViewCell()
        }
        cell.setup(operation: viewModel.operations[indexPath.row])
        return cell
    }
}

