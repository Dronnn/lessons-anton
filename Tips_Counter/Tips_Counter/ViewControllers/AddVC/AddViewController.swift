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
    
    var addCompletion: (() -> Void)?
    
    
    
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
        addCompletion?()
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

