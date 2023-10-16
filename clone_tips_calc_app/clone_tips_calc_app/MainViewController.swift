//
//  MainViewController.swift
//  clone_tips_calc_app
//
//  Created by Eliseev Anton on 13.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    
// MARK: - Outlets
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculate()
    }
// MARK: - ACTIONS
    
    @IBAction func stepperAction(_ sender: Any) {
    }
    
    
    
    
    func calculate() {
        guard let text = amountTextField.text else {
            return
        }
        
        guard let amountNumber = Int(text) else {
            return
        }
        
        tipLabel.text = "\(Double(amountNumber) * (23.0 / 100.0))"
      
        
    }
    
}

// MARK: - EXTENSIONS

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        
        return true
    }
}
