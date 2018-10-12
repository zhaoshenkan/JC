//
//  JCLoginViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCLoginViewController: JCBaseViewController {
    
    var loginView:JCLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kBcgColor
        loginView = JCLoginView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH))
        self.view.addSubview(loginView)
        loginView.loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginView.registBtn.addTarget(self, action: #selector(regist), for: .touchUpInside)
        loginView.timerBtn.addTarget(self, action: #selector(postVerifyCode), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func regist() {
        self.navigationController?.pushViewController(JCRegistViewController(), animated: true)
    }
    
    @objc func forget() {
        self.navigationController?.pushViewController(JCForgetPwdViewController(), animated: true)
    }
    
    @objc func postVerifyCode() {
        
        if (loginView.userNameTxtField.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的手机号")
        }
        self.view.endEditing(true)
        let params = ["mobile":loginView.userNameTxtField.text!];
        JCHttpClient.defult.sendPostRequest(path: "/api/app/msg/sendSms", parameter: params, success: { (response) in
            
            let code:Int = response["code"] as! Int;
            if code == 0 {
                self.loginView.startTime();
            } else {
//                MBProgressHUD.showError(response["desc"] as! String);
            }
            
        }) { (error) in
            
        }

    }
    
    @objc func login() {
        if (loginView.userNameTxtField.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的手机号")
        } else if  (loginView.pwdTextField.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您获取的验证码")
        }
        let params = ["mobile":loginView.userNameTxtField.text!,
                      "smsCode":loginView.pwdTextField.text!];

        JCHttpClient.defult.sendPostRequest(path: "/api/app/user/login", parameter: params, success: { (response) in
            if response["code"] as! Int == 0 {
                let dic = response["data"] as! [String:String];
                let token = dic["userToken"] ;
                UserDefaults.standard.setValue(token, forKey: "token")
                UIApplication.shared.keyWindow?.rootViewController = JCTabBarViewController();
            } else {

            }
            
        }) { (error) in
            
        }
        
    }
}
