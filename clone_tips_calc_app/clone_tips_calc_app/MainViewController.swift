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
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // MARK: - SETUP
    
    
    
    
    // MARK: - ACTIONS
    
    @IBAction func stepperAction(_ sender: Any) {
        //
    }
    
}

// MARK: - LOGIC
    
extension MainViewController {
    
    func calculate(with text: String ) {
        guard 
            let text = amountTextField.text,
            let money = Int(text)
        else {
            return
        }
        print("tetx = \(text)")
        
        guard 
            let percentText = percentLabel.text,
            let percent = Int(percentText)
        else {
            return
        }
        print("percent = \(percent)")
        
        guard
            let howManyPerson = splitLabel.text,
            let split = Int(howManyPerson)
        else {
            return
        }
        
        
        let tips = (Double(money) * (Double(percent) / 100.0)).rounded()
        tipLabel.text = "\(tips)"
        
        let totalMoney = (Double(money) + tips).rounded()
        totalLabel.text = "\(totalMoney)"
        
        let tipPerPerson = (tips / Double(split)).rounded()
        tipPerPersonLabel.text = "\(tipPerPerson)"
        
        let totalTips = (tipPerPerson * Double(split)).rounded()
        totalPerPersonLabel.text = "\(totalTips)"
        
        
    }
}


// MARK: - UITEXTFIELDDELEGATE

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if
            let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            
            calculate(with: updatedText)
        }
        
        return true
    }
}

