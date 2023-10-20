//
//  PercentagesViewController.swift
//  tips calc
//
//  Created by andrew mayer on 18.10.23.
//

import UIKit

class PercentagesViewController: UIViewController {
    
    // MARK: - data
    
    var parcentagesList: [Int] = [11, 22, 33, 44, 55, 66, 77]
    var selectedCellNumber: IndexPath = IndexPath(row: 0, section: 0)
    
    // MARK: - otlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupAppearance()
    }
    
    private func setupAppearance() {
        tableView.layer.cornerRadius = 10.0
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "PercentCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PercentCell.identifier)
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
        tableView.reloadData()
        // установить галочку
        // созранить выбор юзера
        // передать на главный экран
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
        
        cell.config(
            with: PercentCell.ViewModel(
                text: "\(parcentagesList[indexPath.row])",
                isHidden: selectedCellNumber != indexPath
            )
        )
        
        return cell
    }

}
