//
//  MainTabBar.swift
//  mvvm-demo1
//
//  Created by Eliseev Anton on 26.11.2023.
//

import UIKit

class MainTabBar: UITabBarController {
    

// MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupBar()
    }
    
// MARK: Setups
    
    private func setupBar() {
        viewControllers = [
        firstBarItem(),
        secondBarItem(),
        thirdBarItem()
        ]
    }
    
    
    private func firstBarItem() -> UINavigationController {
        let vc = DashBoardViewController(viewModel: DashBoardViewModel())
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(
            title: "Dashboard",
            image: UIImage(systemName: "creditcard.fill"),
            tag: 0)
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }
    
    private func secondBarItem() -> UINavigationController {
        let vc = DashBoardViewController(viewModel: DashBoardViewModel())
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(
            title: "History",
            image: UIImage(systemName: "list.bullet"),
            tag: 0)
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }
    
    private func thirdBarItem() -> UINavigationController {
        let vc = DashBoardViewController(viewModel: DashBoardViewModel())
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            tag: 0)
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }
}
