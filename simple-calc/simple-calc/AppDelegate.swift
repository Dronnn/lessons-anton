//
//  AppDelegate.swift
//  simple-calc
//
//  Created by andrew mayer on 02.11.23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = Configurator.buid()
        window?.makeKeyAndVisible()
        
        return true
    }

}

