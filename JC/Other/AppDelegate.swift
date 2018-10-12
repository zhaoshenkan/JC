//
//  AppDelegate.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.makeKeyAndVisible()
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never;
        }
        
        if  JCUserInfo.share.token.isEmpty {
            let controller: JCNaviViewController? = JCNaviViewController(rootViewController: JCLoginViewController())
            self.window!.rootViewController = controller
        } else {
            self.window!.rootViewController = JCTabBarViewController()
        }

        return true
    }

}

