//
//  SceneDelegate.swift
//  Picture-Match
//
//  Created by Billy McRitchie on 05/03/2025.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        print("SceneDelegate is running Still")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let mainVC = MainViewController()
        let navController = UINavigationController(rootViewController: mainVC)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }


}
