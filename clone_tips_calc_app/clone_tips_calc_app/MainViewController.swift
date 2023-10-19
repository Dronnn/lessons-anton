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
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    @IBOutlet weak var thirdBlockView: UIView!
    
    @IBOutlet weak var secondBlockView: UIView!
    
    @IBOutlet weak var firstBlockView: UIView!
    
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountTextFieldBecomeFerstResponder()
        setupCornersRadius()
        
    }
    
    // MARK: - SETUP
    
    private func thirdBlock(isHidden: Bool) {
        thirdBlockView.isHidden = isHidden
    }
    
    private func setupCornersRadius() {
        let views: [UIView] = [firstBlockView, secondBlockView, thirdBlockView]
        for view in views {
            view.layer.cornerRadius = 10.0
        }
    }
    
    
    // MARK: - ACTIONS
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        splitLabel.text = "\(Int(sender.value))"
        calculate()
        thirdBlock(isHidden: Int(sender.value) < 2)
    }
    
    @IBAction func roundButtonAction(_ sender: UIButton) {
//        tipLabel.text
//        totalLabel.text
//        tipPerPersonLabel.text
//        totalPerPersonLabel.text
    }
    
    
    @IBAction func amountRowButtonTap(_ sender: UIButton) {
        amountTextFieldBecomeFerstResponder()
    }
    
    @IBAction func percentRowButtonTap(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PercentsViewController")
        
        present(vc, animated: true)
    }
    
    @IBAction func screenTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    private func amountTextFieldBecomeFerstResponder() {
        amountTextField.becomeFirstResponder()
    }
    
}

// MARK: - LOGIC
    
extension MainViewController {
    
    func calculate(with text: String? = nil ) {
        
        let text = text ?? amountTextField.text ?? "0.0"
        
        guard
            let money = Double(text),
            let percentText = percentLabel.text?.replacingOccurrences(of: "%", with: ""),
            let percent = Double(percentText),
            let splitText = splitLabel.text,
            let persons = Double(splitText)
                
        else {
            return
        }
        
        let tips = money * (percent / 100.0)
        tipLabel.text = String(format: "%.2f", tips)
        
        let totalMoney = money + tips
        totalLabel.text = String(format: "%.2f", totalMoney)

        let tipPerPerson = tips / persons
        tipPerPersonLabel.text = String(format: "%.2f", tipPerPerson)

        let totalPerPerson = (money / persons) + tipPerPerson
        totalPerPersonLabel.text = String(format: "%.2f", totalPerPerson)

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

