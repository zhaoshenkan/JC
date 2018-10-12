//
//  JCTabBarViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor = .white;
        UITabBar.appearance().isTranslucent = false;
        
        let attributes = [NSAttributedString.Key.foregroundColor : kUnSelColor]
        let selattributes = [NSAttributedString.Key.foregroundColor : kThemeColor]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(selattributes, for: .selected)
        
        self.setChildsControls()

    }

    func setChildsControls() {
        
        let homeVc = JCHomeViewController()
        let meVc = JCMeViewController()
        let messageVc = JCMessageViewController(vcType:2)
        let notificationVc = JCMessageViewController(vcType:1)
        
        self.addChildViewControlls(vc: homeVc, title: "首页", image: "home_unSel", selImage: "home_sel")
        self.addChildViewControlls(vc: notificationVc, title: "系统通知", image: "notification_unSel", selImage: "notification_sel")
        self.addChildViewControlls(vc: messageVc, title: "系统通告", image: "message_unSel", selImage: "message_sel")
        self.addChildViewControlls(vc: meVc, title: "个人中心", image: "me_unSel", selImage: "me_sel")
    }
    
    func addChildViewControlls(vc:UIViewController, title:String, image:String, selImage:String) {
        vc.tabBarItem.title = title;
        let unSelImg = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        let selImg = UIImage.init(named: selImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.image = unSelImg
        vc.tabBarItem.selectedImage = selImg
        self.addChild(JCNaviViewController(rootViewController: vc))
    }

}
