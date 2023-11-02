//
//  ViewController.swift
//  simple-calc
//
//  Created by andrew mayer on 02.11.23.
//

import UIKit
import SnapKit
import EasyPeasy

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        // create and init
        let blueView = UIView(frame: .zero)
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        // add to hierarchy
        view.addSubview(blueView)
        
        // add constarints (or frames)
                
//        NSLayoutConstraint.activate([
//            blueView.widthAnchor.constraint(equalToConstant: 200),
//            blueView.heightAnchor.constraint(equalToConstant: 100),
//            blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
        
//        blueView.snp.makeConstraints {
//            $0.width.equalTo(200)
//            $0.height.equalTo(100)
//            $0.centerX.centerY.equalToSuperview()
//        }
        
        blueView.easy.layout(
            Width(200),
            Height(100),
            CenterX(),
            CenterY()
        )
        
    }


}

