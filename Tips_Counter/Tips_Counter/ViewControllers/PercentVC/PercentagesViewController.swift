//
//  PercentagesViewController.swift
//  Tips_Counter
//
//  Created by Eliseev Anton on 27.10.2023.
//

import UIKit

protocol PercentageViewControllerDelegate: AnyObject {
    func percentSelected()
}

class PercentagesViewController: UIViewController {
    
// MARK: - TABLEVIEW SIDE TYPES
    
    enum Sides {
        case top
        case bottom
    }
    
// MARK: - OUTLETS

    @IBOutlet weak var tableView: UITableView!
    
    
// MARK: - VARIABLES
    
    weak var delegate: PercentageViewControllerDelegate?
    
// MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearenceTableView()
        setupCheckMark()
    }
    
    
// MARK: - SETUP
    
    private func setupAppearenceTableView() {
        tableView.layer.cornerRadius = 10.0
    }
    
    private func setupCheckMark() {
        let index = DataManager.shared.percentagesArray.firstIndex(where: { $0 == DataManager.shared.selectedPercent}) ?? 0
        DataManager.shared.selectedCellNumber = IndexPath(row: index, section: 0)
    }
    
    private func setupCornersRadius(_ cell: PercentTableViewCell, on side: Sides) {
        switch side {
        case .top:
            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
    }
    
    private func setupCellCornersRadius(for cell: PercentTableViewCell, on indexPath: IndexPath) {
        if indexPath.row == 0 {
            setupCornersRadius(cell, on: .top)
        } else if indexPath.row == DataManager.shared.percentagesArray.count - 1 {
            setupCornersRadius(cell, on: .bottom)
        }
    }
    
// MARK: - ACTIONS
    
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
       guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddViewController")
                as? AddViewController else { return }
        vc.addCompletion = { [ weak self ] in
            self?.tableView.reloadData()
        }
        present(vc, animated: true)
    }
    
}


// MARK: - DATASOURCE

extension PercentagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManager.shared.percentagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PercentTableViewCell else { fatalError("Ячейка PercentTableViewCell не создана") }
        
        setupCellCornersRadius(for: cell, on: indexPath)
        
        cell.confug(
            title: "\(DataManager.shared.percentagesArray[indexPath.row])%",
            isSelected: DataManager.shared.percentagesArray[indexPath.row] == DataManager.shared.selectedPercent
        )
        
        return cell
    }
    
    
}





// MARK: - DELEGATE

extension PercentagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DataManager.shared.selectedCellNumber = indexPath
        DataManager.shared.selectedPercent = DataManager.shared.percentagesArray[indexPath.row]
        tableView.reloadData()
        delegate?.percentSelected()
        dismiss(animated: true)
    }
    
}
