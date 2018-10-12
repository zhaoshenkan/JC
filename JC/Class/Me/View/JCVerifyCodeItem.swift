//
//  JCVerifyCodeItem.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/16.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCVerifyCodeItem: UIView {
    
    var titleLbl:UILabel!
    var textFiled:UITextField!
    var timerBtn:UIButton!
    var timer:Timer!
    var seconds:Int = 60;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: 80, height: self.viewHeight));
        titleLbl.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(titleLbl)
        
        timerBtn = UIButton.init(frame:  CGRect.init(x: kscreenW - 110, y: (self.viewHeight - 35)/2, width: 100, height: 35))
        timerBtn.setTitle("获取验证码", for: .normal)
        timerBtn.backgroundColor = kThemeColor;
        timerBtn.isEnabled = true;
        timerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        timerBtn.layer.cornerRadius = 4;
        self.addSubview(timerBtn)
        
        textFiled = UITextField.init(frame: CGRect.init(x: titleLbl.viewRightX + 10, y: 0, width: 120, height: self.viewHeight))
        textFiled.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(textFiled)
        
        let downline = UILabel.init(frame: CGRect.init(x: 0, y: self.viewHeight - 0.8, width: kscreenW, height: 0.8))
        downline.backgroundColor = kLineColor
        self.addSubview(downline)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
}
