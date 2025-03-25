//
//  AppDelegate.swift
//  Picture-Match
//
//  Created by Billy McRitchie on 05/03/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // For iOS 12 and earlier – SceneDelegate handles iOS 13+
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            // iOS 13+ will use SceneDelegate for window management.
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            let mainVC = MainViewController()
            let navController = UINavigationController(rootViewController: mainVC)
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle for iOS 13+
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: "Default Configuration",
                                          sessionRole: connectingSceneSession.role)
        return config
    }
}
