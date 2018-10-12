//
//  JCNaviViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCNaviViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.colorWith(hex: "333333"),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)] as [AnyHashable : NSObject]
        UINavigationBar.appearance().titleTextAttributes = attributes as? [NSAttributedString.Key : Any]
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false;
        

       let img = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
       self.navigationBar.backIndicatorImage = img
       self.navigationBar.backIndicatorTransitionMaskImage = img
        
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            let btnBack = UIBarButtonItem.init()
            btnBack.title = ""
            
            let vc:UIViewController = self.viewControllers.last!
            vc.navigationItem.backBarButtonItem = btnBack
            
        }
        super.pushViewController(viewController, animated: true)
        
    }



}
