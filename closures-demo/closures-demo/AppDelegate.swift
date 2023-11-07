//
//  AppDelegate.swift
//  closures-demo
//
//  Created by andrew mayer on 06.11.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = FirstViewController()
        window?.makeKeyAndVisible()

        return true
    }

}

