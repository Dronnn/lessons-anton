//
//  PercentagesViewController.swift
//  tips calc
//
//  Created by andrew mayer on 18.10.23.
//

import UIKit

protocol PercentagesViewControllerDelegate {
    func percentSelected()
}

class PercentagesViewController: UIViewController {
    
    // MARK: - types
    
    enum Sides {
        case top
        case bottom
    }
    
    // MARK: - data
    
    var parcentagesList: [Int] = DataManager.shared.percentsages
    var selectedCellNumber = IndexPath(row: 0, section: 0)
    
    // MARK: - otlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - variables
    
    var delegate: PercentagesViewControllerDelegate?
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupAppearance()
        setupCheckmark()
    }
    
    // MARK: - setup
        
    private func setupAppearance() {
        tableView.layer.cornerRadius = 10.0
    }
    
    private func setupCheckmark() {
        let index = parcentagesList.firstIndex(where: { $0 == DataManager.shared.selectedPercent }) ?? 0
        selectedCellNumber = IndexPath(row: index, section: 0)
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "PercentCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PercentCell.identifier)
    }
    
    private func setupCorners(_ cell: PercentCell, on side: Sides) {
        switch side {
        case .top:
            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
    }
    
    private func setupCornerRadius(for cell: PercentCell, on indexPath: IndexPath) {
        if indexPath.row == 0 {
            setupCorners(cell, on: .top)
        } else if indexPath.row == parcentagesList.count - 1 {
            setupCorners(cell, on: .bottom)
        }
    }
    
    // MARK: - actions
    
    @IBAction func addAction(_ sender: Any) {
        //
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - UITableViewDelegate

extension PercentagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellNumber = indexPath
        DataManager.shared.selectedPercent = parcentagesList[indexPath.row]
        tableView.reloadData()
        delegate?.percentSelected()
        dismiss(animated: true)
    }
}

// MARK: - UITableViewDataSource

extension PercentagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        parcentagesList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PercentCell.identifier,
                for: indexPath
            ) as? PercentCell
        else { fatalError() }
        
        setupCornerRadius(for: cell, on: indexPath)
        
        cell.config(
            with: PercentCell.ViewModel(
                text: "\(parcentagesList[indexPath.row])",
                isHidden: selectedCellNumber != indexPath
            )
        )
        
        return cell
    }
}
