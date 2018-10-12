//
//  JCRechargeViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/12.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCRechargeViewController: JCBaseViewController {
    
    var mainView:JCRechargeView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView()  {
        self.navigationItem.title = "充值"
        mainView = JCRechargeView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)))
        self.view.addSubview(mainView)
    }
    
}
