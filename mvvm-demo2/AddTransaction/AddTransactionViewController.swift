//
//  AddTransactionViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 30.12.2023.
//

import UIKit

class AddTransactionViewController: UIViewController {
    
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
        setupTopLine()
    }
    
// MARK: Setups
    
    private func setupTopLine() {
        view.addSubview(xButton)
        view.addSubview(mainLabel)
        view.addSubview(saveButton)
        
        view.addSubview(segments)
        
        
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
