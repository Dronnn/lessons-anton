//
//  PercentsViewController.swift
//  clone_tips_calc_app
//
//  Created by Eliseev Anton on 19.10.2023.
//

import UIKit

class PercentsViewController: UIViewController {

//MARK: - DATA
    
     var persentages: [Int] = [10, 15, 20, 25, 30]
     var selectedPercent: IndexPath = IndexPath(row: 0, section: 0)
    
    
// MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
// MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupTableView()
        setupAppearence()
    }

// MARK: - SETUP
//    private func setupTableView() {
//        let nib = UINib(nibName: "PercentageTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "PercentageTableViewCell")
//    }
    
    private func setupAppearence() {
        tableView.layer.cornerRadius = 10
    }

    
// MARK: - ACTIONS
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddPercentViewController")
        present(vc, animated: true )
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}

// MARK: - LOGIC
extension PercentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPercent = indexPath
            tableView.reloadData()
    }
    
}


extension PercentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persentages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PercentageTableViewCell else { fatalError() }
        
        cell.config(with: PercentageTableViewCell.PecentsModel(number: "\(persentages[indexPath.row])", isHidden: selectedPercent != indexPath))
        
        return cell
    }
    
    
}
