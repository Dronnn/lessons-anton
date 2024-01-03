//
//  AddTransactionViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 30.12.2023.
//

import UIKit

class AddTransactionViewController: UIViewController {
    
    enum Sections: Int, CaseIterable {
        case first
        case second
        case third
    }
    
    // MARK: TableView
    
    private lazy var tableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .red
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: SubViews
    
    private lazy var xButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(dismisScreen), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Main Label"
        return label
    }()
    
    private lazy var saveButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.addTarget(self, action: #selector(saved), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var segments = {
        let segment = UISegmentedControl(items: ["Расходы", "Доходы"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private lazy var firstBigSectionView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
    // MARK: Properties
    
    private var viewModel: AddTransactionModelProtocol
    
    
    // MARK: Life Cycle
    
    init(viewModel: AddTransactionModelProtocol) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Добавьте транзакцию"
        view.backgroundColor = UIColor(named: "bgColor")
        setupTableView()
        setupTopLine()
    }
    
// MARK: Setups
    
    private func setupTableView() {
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AddTransactionTableViewCell.self, forCellReuseIdentifier: AddTransactionTableViewCell.identifier)
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.identifier)
        
       
    }
    
    private func setupTopLine() {
        view.addSubview(xButton)
        view.addSubview(mainLabel)
        view.addSubview(saveButton)
        view.addSubview(segments)
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            xButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            xButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            
            segments.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            segments.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            segments.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: segments.bottomAnchor, constant: 20),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    
    @objc
    func dismisScreen() {
        dismiss(animated: true)
    }
    
    @objc
    func saved() {
        print("was saved")
    }
}


extension AddTransactionViewController: UITableViewDataSource {
    
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
            return 3
        case .second:
            return 1
        case .third:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 || indexPath.row == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddTransactionTableViewCell.identifier, for: indexPath) as? AddTransactionTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as? DateTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }

    
}

extension AddTransactionViewController: UITableViewDelegate {
    
}
