//
//  AppDelegate.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 09.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.backgroundColor = .orange
        window?.makeKeyAndVisible()
        
        return true
    }
}
