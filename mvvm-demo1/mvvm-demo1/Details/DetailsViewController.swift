//
//  DetailsViewController.swift
//  mvvm-demo1
//
//  Created by andrew mayer on 04.12.23.
//

import UIKit

class DetailsViewController: UIViewController {

    var opetation: Operation?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"

        view.backgroundColor = .red
        
        setupRemoveButton()

        navigationItem.largeTitleDisplayMode = .never
    }

    // MARK: - setups

    private func setupRemoveButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "trash"),
            target: self,
            action: #selector(remove)
        )
    }

    // MARK: - actions

    @objc
    func remove() {
        navigationController?.popViewController(animated: true)
    }

}
