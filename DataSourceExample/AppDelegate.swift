//
//  AppDelegate.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let controller = TestController(viewModel: TestControllerViewModel())
        window?.rootViewController = controller
        
        return true
    }
}
