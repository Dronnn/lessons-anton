//
//  AppDelegate.swift
//  WeatherAppClone
//
//  Created by Eliseev Anton on 25.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = AdoptedScreenViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

