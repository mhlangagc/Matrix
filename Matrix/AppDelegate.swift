//
//  AppDelegate.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DependencyContainer.registerDefaults()
        window = setupBaseRouting()
        return true
    }
    
    private func setupBaseRouting() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.tintColor = .black
        window.rootViewController = UINavigationController(rootViewController: MovieViewController())
        return window
    }
}

