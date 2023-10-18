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
    
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var tipsView: UIView!
    @IBOutlet weak var totalView: UIView!
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextFieldBecomeFirstRespoder()
        setupAppearance()
    }
    
    // MARK: - setup
    
    private func totalBlock(isHidden: Bool) {
        totalView.isHidden = isHidden
    }
    
    private func setupAppearance() {
        amountView.layer.cornerRadius = 10.0
        tipsView.layer.cornerRadius = 10.0
        totalView.layer.cornerRadius = 10.0
    }
    
    
    // MARK: - actions
    
    @IBAction func peopeNumberChanged(_ sender: UIStepper) {
        peopleNumberLabel.text = "\(Int(sender.value))"
        calculate()
        totalBlock(isHidden: Int(sender.value) < 2)
    }
    
    @IBAction func screenTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func doAmountTextFieldFirstRespoder(_ sender: UIButton) {
        amountTextFieldBecomeFirstRespoder()
    }
    
    private func amountTextFieldBecomeFirstRespoder() {
        amountTextField.becomeFirstResponder()
    }
    
    @IBAction func doRound(_ sender: UIButton) {
        tipPerPersonLabel.text = ""
        totoalPerPersonLabel.text = ""
        totalTipsLabel.text = ""
        totalMoneyLabel.text = ""
    }

    @IBAction func showPercentagesViewController(_ sender: UIButton) {
        
//      let vc = PercentagesViewController()
        
        let vc = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "PercentagesViewController"
        )
        
        present(vc, animated: true)
    }
    
}

// MARK: - logic

extension MainViewController {
    
    func calculate(with text: String? = nil) {
        let text = text ?? amountTextField.text ?? "0.0"
        guard
            let money = Double(text),
            let percentText = percentLabel.text?
                .replacingOccurrences(of: "%", with: ""),
            let percent = Double(percentText),
            let peopleText = peopleNumberLabel.text,
            let peopleCount = Double(peopleText)
        else {
            return
        }
        
        let totalTips = money * (percent / 100.0)
        let totalMoney = money + totalTips

        let tipPerPerson = totalTips / peopleCount
        let totalPerPerson = totalMoney / peopleCount
        
        tipPerPersonLabel.text = String(format: "%.2f", tipPerPerson)
        totoalPerPersonLabel.text = String(format: "%.2f", totalPerPerson)
        totalTipsLabel.text = String(format: "%.2f", totalTips)
        totalMoneyLabel.text = String(format: "%.2f", totalMoney)
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
