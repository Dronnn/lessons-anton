//
//  MainViewController.swift
//  clone_tips_calc_app
//
//  Created by Eliseev Anton on 13.10.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Push the Button"
    }

    @IBAction func doChanges(_ sender: Any) {
        textLabel.text = "Hello"
    }
    
}

