//
//  MainViewController.swift
//  Tips_Counter
//
//  Created by Eliseev Anton on 27.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    
// MARK: - OUTLETS
    
    @IBOutlet weak var amountTextFieldLabel: UITextField!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var howManyPersonsLabel: UILabel!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var percentsLabel: UILabel!
    
    @IBOutlet weak var thirdBlockView: UIView!
    @IBOutlet weak var secondBlockView: UIView!
    @IBOutlet weak var firstBlockView: UIView!
    
    
    // MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextFieldLabel.delegate = self
        amountTextFieldBecomeFirstResponder()
        setupViews()
        percentSelected()
    }
    
    
    
// MARK: - SETUPS
    
    private func setupViews() {
        firstBlockView.layer.cornerRadius = 10
        secondBlockView.layer.cornerRadius = 10
        thirdBlockView.layer.cornerRadius = 10
    }
    
    private func thirdBlockIsHidden(isHidden: Bool) {
        thirdBlockView.isHidden = isHidden
    }
    
    private func amountTextFieldBecomeFirstResponder() {
        amountTextFieldLabel.becomeFirstResponder()
    }
    
    
    
// MARK: - ACTIONS
    
    @IBAction func roundButtonAction(_ sender: UIButton) {
        if
            let tipText = tipsLabel.text,
            let totalText = totalLabel.text,
            let tipPerPersonText = tipPerPersonLabel.text,
            let totalPerPersonText = totalPerPersonLabel.text {
            
            if
                let tipValue = Double(tipText),
                let totalValue = Double(totalText),
                let tipPerPersonValue = Double(tipPerPersonText),
                let totalPerPersonValue = Double(totalPerPersonText) {
                
                tipsLabel.text = String(Int(ceil(tipValue)))
                totalLabel.text = String(Int(ceil(totalValue)))
                tipPerPersonLabel.text = String(Int(ceil(tipPerPersonValue)))
                totalPerPersonLabel.text = String(Int(ceil(totalPerPersonValue)))
            }
        }
    }
    
    @IBAction func splitAction(_ sender: UIStepper) {
        howManyPersonsLabel.text = "\(Int(sender.value))"
        calculate()
        thirdBlockIsHidden(isHidden: Int(sender.value) < 2)
    }
    
    @IBAction func screenTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func amountButtonAction(_ sender: UIButton) {
        amountTextFieldBecomeFirstResponder()
    }
    
    @IBAction func percentsButtonAction(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PercentagesViewController")
        
        present(vc, animated: true)
    }
    
}

// MARK: - LOGIC

extension MainViewController {
    func calculate(with text: String? = nil) {
        let text = text ?? amountTextFieldLabel.text ?? "0.0"
        
        guard
            let money = Double(text),
            let percentsText = percentsLabel.text?.replacingOccurrences(of: "%", with: ""),
            let percents = Double(percentsText),
            let personsText = howManyPersonsLabel.text,
            let persons = Double(personsText)
        else {
            return
        }
        
        let tips = money * ( percents / 100 )
        let total = money + tips
        let tipsPerPerson = tips / persons
        let totalPerPerson = total / persons
        
        tipsLabel.text = String(format: "%.2f", tips)
        totalLabel.text = String(format: "%.2f", total)
        tipPerPersonLabel.text = String(format: "%.2f", tipsPerPerson)
        totalPerPersonLabel.text = String(format: "%.2f", totalPerPerson)
    }
}




// MARK: - UITEXTFIELDDELEGATE
extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if
            let text = textField.text,
            let textRange = Range(range, in: text)
        {
            let updateText = text.replacingCharacters(in: textRange, with: string)
            
            calculate(with: updateText)
        }
        return true
    }
}

// MARK: - PERSENTAGESVIEWCONTROLLERDELEGATE

extension MainViewController: PercentageViewControllerDelegate {
    func percentSelected() {
        percentsLabel.text = "\(DataManager.shared.selectedPercent)%"
        calculate()
    }
    
    
}
