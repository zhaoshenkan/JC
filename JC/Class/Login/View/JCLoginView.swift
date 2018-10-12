//
//  JCLoginView.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCLoginView: UIView {
    
    var  userNameTxtField:UITextField!
    var pwdTextField:UITextField!
    var loginBtn:UIButton!
//    var forgetBtn:UIButton!
    var registBtn:UIButton!
    var timerBtn:UIButton!
    var timer:Timer!
    var seconds:Int = 60;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    func initView() {
        
        userNameTxtField = UITextField.init(frame: CGRect.init(x: 20, y: 150, width: kscreenW - 40, height: 40))
        userNameTxtField.placeholder = "请输入您的用户名"
        userNameTxtField.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(userNameTxtField)
        
        let downline:UILabel = UILabel.init(frame: CGRect.init(x: 20, y: userNameTxtField.viewBottomY, width: kscreenW - 40, height: 0.8));
        downline.backgroundColor = kLineColor;
        self.addSubview(downline)
        
//        pwdTxtField = UITextField.init(frame: CGRect.init(x: 20, y: downline.viewBottomY, width: kscreenW - 40, height: 40))
//        pwdTxtField.placeholder = "请输入您的密码"
//        pwdTxtField.font = UIFont.systemFont(ofSize: 15)
//        self.addSubview(pwdTxtField)
        
        pwdTextField = UITextField.init(frame: CGRect.init(x: 20, y: downline.viewBottomY, width: kscreenW - 40 - 110, height: 45))
        pwdTextField.font = UIFont.systemFont(ofSize: 15)
        pwdTextField.placeholder = "请输入您的验证码";
        self.addSubview(pwdTextField)
        
        timerBtn = UIButton.init(frame:  CGRect.init(x: downline.viewRightX - 100, y: downline.viewBottomY + 5, width: 100, height: 35))
        timerBtn.setTitle("获取验证码", for: .normal)
        timerBtn.backgroundColor = kThemeColor;
        timerBtn.isEnabled = true;
        timerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        timerBtn.layer.cornerRadius = 4;
        self.addSubview(timerBtn)

        let downline2:UILabel = UILabel.init(frame: CGRect.init(x: 20, y: pwdTextField.viewBottomY, width: kscreenW - 40, height: 0.8));
        downline2.backgroundColor = kLineColor;
        self.addSubview(downline2)
        
        registBtn = UIButton.init(frame: CGRect.init(x: downline2.viewX, y: downline2.viewBottomY + 5, width: 60, height: 30))
        registBtn.setTitle("注册账号", for: .normal)
        registBtn.setTitleColor(.black, for: .normal)
        registBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(registBtn)
//
//        forgetBtn = UIButton.init(frame: CGRect.init(x: downline2.viewRightX - 60, y: downline2.viewBottomY + 5, width: 60, height: 30))
//        forgetBtn.setTitle("忘记密码", for: .normal)
//        forgetBtn.setTitleColor(.black, for: .normal)
//        forgetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
//        self.addSubview(forgetBtn)
        
        loginBtn = UIButton.init(frame: CGRect.init(x: 20, y: registBtn.viewBottomY + 20, width: kscreenW - 40, height: 40))
        loginBtn.setTitle("登陆", for: .normal)
        loginBtn.layer.cornerRadius = 4;
        loginBtn.layer.masksToBounds = true;
        loginBtn.backgroundColor = kThemeColor
        self.addSubview(loginBtn)
        
    }
    
    @objc func startTime(){
        timerBtn.isEnabled = false;
        timerBtn.backgroundColor = kUnSelColor;
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timer.schedule(wallDeadline: .now(), repeating: 1)
        timer.setEventHandler(handler: {
            self.seconds = self.seconds - 1;
            DispatchQueue.main.async {
                self.timerBtn.setTitle("\(self.seconds)秒", for: .normal)
                if self.seconds == 0 {
                    timer.cancel()
                    self.seconds = 60
                    self.timerBtn.setTitle("获取验证码", for: .normal)
                    self.timerBtn.backgroundColor = kThemeColor;
                    self.timerBtn.isEnabled = true;
                }
            }
        })
        timer.resume()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
