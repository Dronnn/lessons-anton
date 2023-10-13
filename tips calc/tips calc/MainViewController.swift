//
//  MainViewController.swift
//  tips calc
//
//  Created by andrew mayer on 13.10.23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        titleLabel.text = "hello!"
        
        actionButton.setTitle("action", for: .normal)
    }

    @IBAction 
    func doAction(_ sender: Any) {
        titleLabel.text = "button was pressed"
    }
    
}

