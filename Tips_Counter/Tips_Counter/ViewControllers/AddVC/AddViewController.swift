//
//  AddViewController.swift
//  Tips_Counter
//
//  Created by Eliseev Anton on 01.11.2023.
//

import UIKit

class AddViewController: UIViewController {
    
    
// MARK: - OUTLETS
    
    @IBOutlet weak var rowView: UIView!
    
    @IBOutlet weak var addPercentTextField: UITextField!
    
// MARK: - LIFE CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
    }

// MARK: - ACTIONS

    
    @IBAction func screenTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        DataManager.shared.percentagesArray.append(addNew())
        dismiss(animated: true)
    }
    
    @IBAction func rowButtonAction(_ sender: UIButton) {
        addPercentTextFieldBecomeFirstResponder()
    }
    
    
    
// MARK: - SETUP
    
    private func setupAppearence() {
        rowView.layer.cornerRadius = 10
    }
    
    private func addPercentTextFieldBecomeFirstResponder() {
        addPercentTextField.becomeFirstResponder()
    }
}

// MARK: - LOGIC

extension AddViewController {
    func addNew(percent text: String? = nil) -> Int {
        let text = text ?? addPercentTextField.text ?? "0"
        let newPercent = Int(text) ?? 10
        return newPercent
    }
}


// MARK: UITEXTFIELDDELEGATE

extension AddViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if
            let text = addPercentTextField.text,
            let textRange = Range(range, in: text)
        {
            let updateText = text.replacingCharacters(in: textRange, with: string)
        }
        return true
    }
}
