//
//  MainTabBar.swift
//  mvvm-demo
//
//  Created by andrew mayer on 25.11.23.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }

    private func setup() {
        viewControllers = [
            firstScreen(),
            secondScreen(),
            thirdScreen(),
        ]
    }

    private func firstScreen() -> UINavigationController {
        let vc = DashboardViewController(viewModel: DashboardViewModel())
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(
            title: "Dashboard",
            image: UIImage(systemName: "creditcard.fill"),
            tag: 0
        )
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }

    private func secondScreen() -> UINavigationController {
        let vc = HistoryViewController()
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(
            title: "History",
            image: UIImage(systemName: "list.bullet"),
            tag: 1
        )
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }

    private func thirdScreen() -> UINavigationController {
        let vc = SettingsViewController()
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            tag: 2
        )
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }
}
