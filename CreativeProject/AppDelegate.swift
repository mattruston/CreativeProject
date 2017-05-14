//
//  AppDelegate.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/26/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GameNavigationControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = GameNavigationController()
        navigationController.gameDelegate = self
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    // Restarts the app
    func gameFinished() {
        UIView.animate(withDuration: 0.5, animations: { 
            self.window?.rootViewController?.view.alpha = 0
        }) { _ in
            self.window?.rootViewController = nil
            let navigationController = GameNavigationController()
            navigationController.gameDelegate = self
            navigationController.view.alpha = 0
            self.window?.rootViewController = navigationController
            
            UIView.animate(withDuration: 0.5, animations: { 
                navigationController.view.alpha = 1
            })
        }
    }
}

