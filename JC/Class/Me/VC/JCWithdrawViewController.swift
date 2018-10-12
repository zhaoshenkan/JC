//
//  JCWithdrawViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/12.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCWithdrawViewController: JCBaseViewController {
    
    var mainView:JCWithdrawView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView()  {
        self.navigationItem.title = "积分兑换"
        mainView = JCWithdrawView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)))
        self.view.addSubview(mainView)
        mainView.sureBtn.addTarget(self, action: #selector(postWithdraw), for: .touchUpInside)
        
        mainView.balanceItem.contentLbl.text = JCUserInfo.share.account
    }
    
    
  @objc func postWithdraw()  {
    
    if (mainView.withdrawItem.textFiled.text?.isEmpty)! {
       return MBProgressHUD.showError("请输入提现金额")
    }
    let jifen = Int(mainView.withdrawItem.textFiled.text ?? "") ?? 0
    guard (jifen < Int(JCUserInfo.share.account) ?? 0) else {
        return MBProgressHUD.showError("输入正确积分")
    }
    
    let params = ["money":mainView.withdrawItem.textFiled.text!];
    JCHttpClient.defult.sendPostRequest(path: "/api/app/account/withdrawCash", parameter: params, success: { (response) in
        let code:Int = response["code"] as! Int;
        if code == 0 {
            MBProgressHUD.showSuccess("提现成功")
            self.navigationController?.popViewController(animated: true)
        } else {
            
        }
        
    }) { (error) in
        
    }
 }
}
