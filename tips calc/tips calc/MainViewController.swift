//
//  MainViewController.swift
//  tips calc
//
//  Created by andrew mayer on 13.10.23.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - outlets
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var peopleNumberLabel: UILabel!
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    @IBOutlet weak var totoalPerPersonLabel: UILabel!
    @IBOutlet weak var totalTipsLabel: UILabel!
    @IBOutlet weak var totalMoneyLabel: UILabel!
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - setup
    
    
    // MARK: - actions
    
    @IBAction func peopeNumberChanged(_ sender: UIStepper) {
        //
    }
}

// MARK: - logic

extension MainViewController {
    
    func calculate(with text: String) {
        guard let money = Int(text) else { return }

        print("money = \(money)")
        
        guard
            let percenText = percentLabel.text,
            let percent = Int(percenText)
        else {
            return
        }
        
        print("percent = \(percent)")
        
        let totalTips = Double(money) * (Double(percent) / 100.0)
        let totalMoney = Double(money) + totalTips
        
        tipPerPersonLabel.text = "qqq"
        totoalPerPersonLabel.text = "qqq"
        totalTipsLabel.text = "\(totalTips)"
        totalMoneyLabel.text = "\(totalMoney)"
    }
    
}

// MARK: - UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        
        if 
            let text = textField.text,
            let textRange = Range(range, in: text) 
        {
            let updatedText = text
                .replacingCharacters(
                    in: textRange,
                    with: string
                )
            
            calculate(with: updatedText)
        }
        
        return true
    }
}
