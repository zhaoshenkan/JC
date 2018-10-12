//
//  JCRegistViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCRegistViewController: JCBaseViewController {
    
    var registView:JCRegistView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "注册"
        
        registView = JCRegistView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH))
        registView.sureBtn.addTarget(self, action: #selector(postRegist), for: .touchUpInside)
        registView.phoneCodeItem.timerBtn.addTarget(self, action: #selector(postVerifyCode), for: .touchUpInside)
        self.view.addSubview(registView)
    }

    @objc func postRegist() {
        if (registView.nickNameItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的姓名")
        } else if (registView.phoneItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的手机号")
        } else if (registView.phoneCodeItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的验证码")
        } else if (registView.inviteCodeItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的邀请码")
        }
        self.view.endEditing(true)
        let params = ["nickName":registView.nickNameItem.textFiled.text ?? "",
                      "mobile":registView.phoneItem.textFiled.text ?? "",
                      "smsCode":registView.phoneCodeItem.textFiled.text ?? "",
                      "invitationCode":registView.inviteCodeItem.textFiled.text ?? ""]
 
        JCHttpClient.defult.sendPostRequest(path: "/api/app/user/register", parameter: params, success: { (response) in
            if response["code"] as! Int == 0 {
                MBProgressHUD.showSuccess("注册成功")
                self.navigationController?.popViewController(animated: true);
            } else {

            }
            
        }) { (error) in
            
        }
        
    }
    
    @objc func postVerifyCode() {
    
        if (registView.phoneItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的手机号")
        }
        self.view.endEditing(true)
        let params = ["mobile":registView.phoneItem.textFiled.text!];
        
        JCHttpClient.defult.sendPostRequest(path: "/api/app/msg/sendSms", parameter: params, success: { (response) in
            
            let code:Int = response["code"] as! Int;
            if code == 0 {
                self.registView.phoneCodeItem.startTime()
            } else {
                MBProgressHUD.showError(response["desc"] as! String);
            }
            
        }) { (error) in
            
        }

    }
}
