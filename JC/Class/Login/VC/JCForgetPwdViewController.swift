//
//  JCForgetPwdViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCForgetPwdViewController: JCBaseViewController {
    
    var forgetPwdView:JCForgetPwdView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "忘记密码"
        
        forgetPwdView = JCForgetPwdView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH))
        forgetPwdView.sureBtn.addTarget(self, action: #selector(postForgetPwd), for:.touchUpInside )
        forgetPwdView.phoneCodeItem.timerBtn.addTarget(self, action: #selector(postVerifyCode), for:.touchUpInside )
        self.view.addSubview(forgetPwdView)
    }
    
    @objc func postForgetPwd() {
        
        if (forgetPwdView.phoneItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的电话")
        } else if (forgetPwdView.phoneCodeItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您收到的验证码")
        } else if (forgetPwdView.pwdItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的新密码")
        }  else if (forgetPwdView.pwdItem.textFiled.text != forgetPwdView.surePwdItem.textFiled.text ) {
            return MBProgressHUD.showError("请确保两次密码一致")
        }
        
        let params = ["phone":forgetPwdView.phoneItem.textFiled.text ?? "",
                      "passwd":forgetPwdView.pwdItem.textFiled.text ?? "",
                      "validCode": forgetPwdView.phoneCodeItem.textFiled.text ?? "",
                      "repasswd":forgetPwdView.surePwdItem.textFiled.text ?? "",
        ];
        JCHttpClient.defult.postRequestWithFormData(path:  "/front/user/fogetPwd", parameter: params, complection: { (response) in
            do {
                _ = try JSONDecoder().decode(JCBaseModel.self, from: response)
                MBProgressHUD.showSuccess("修改密码成功");
                self.navigationController?.popViewController(animated: true)
                
            } catch {
                print(error.localizedDescription)
            }
            
        }) { (error) in
            
        }
    }
    
    @objc func postVerifyCode() {
        
        if (forgetPwdView.phoneItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的手机号")
        }
        self.view.endEditing(true)
        let params = ["phone":forgetPwdView.phoneItem.textFiled.text!];
        JCHttpClient.defult.postRequestWithFormData(path:  "/front/sms/smsCode", parameter: params, complection: { (response) in
            do {
                _ = try JSONDecoder().decode(JCBaseModel.self, from: response)
                self.forgetPwdView.phoneCodeItem.startTime()
            } catch {
                print(error.localizedDescription)
            }
            
        }) { (error) in
            
        }
    }


}
