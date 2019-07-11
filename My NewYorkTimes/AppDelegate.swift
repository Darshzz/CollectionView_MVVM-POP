//
//  AppDelegate.swift
//  My NewYorkTimes
//
//  Created by Darshan on 08/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let appStartVC = ArticleListVC.instance() as! ArticleListVC
        appStartVC.articleVM = ArticleViewModel()
        let nav = UINavigationController(rootViewController: appStartVC)
        nav.navigationBar.barTintColor = .orange
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }
}

