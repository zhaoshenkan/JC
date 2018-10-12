//
//  JCRegistView.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCRegistView: UIView {
    
    var scrollView:UIScrollView!
    var nickNameItem:JCRegistItem!
    var phoneItem:JCRegistItem!
    var phoneCodeItem:JCVerifyCodeItem!
//    var pwdItem:JCRegistItem!
//    var surePwdItem:JCRegistItem!
    var inviteCodeItem:JCRegistItem!
    var sureBtn:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var dataArr:[(String,String)] = [("昵称","请输入姓名"),
                                        ("手机号","请输入手机号"),
                                        ("验证码","请输入验证码"),
                                        ("邀请码","请输入邀请码")]
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight) - CGFloat(KTabbarSafeBottomMargin)))
        self.addSubview(scrollView)
        
        nickNameItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: 20, width: kscreenW, height: 45))
        scrollView.addSubview(nickNameItem)
        let tumples = dataArr[0];
        nickNameItem.titleLbl.text = tumples.0
        nickNameItem.textFiled.placeholder = tumples.1
        
        phoneItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: nickNameItem.viewBottomY, width: kscreenW, height: 45))
        scrollView.addSubview(phoneItem)
        let tumples1 = dataArr[1];
        phoneItem.titleLbl.text = tumples1.0
        phoneItem.textFiled.placeholder = tumples1.1
        
        phoneCodeItem = JCVerifyCodeItem.init(frame: CGRect.init(x: 0, y: phoneItem.viewBottomY, width: kscreenW, height: 45))
        scrollView.addSubview(phoneCodeItem)
        let tumples2 = dataArr[2];
        phoneCodeItem.titleLbl.text = tumples2.0
        phoneCodeItem.textFiled.placeholder = tumples2.1
        
//        pwdItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: phoneCodeItem.viewBottomY, width: kscreenW, height: 45))
//        scrollView.addSubview(pwdItem)
//        let tumples3 = dataArr[3];
//        pwdItem.titleLbl.text = tumples3.0
//        pwdItem.textFiled.placeholder = tumples3.1
//
//        surePwdItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: pwdItem.viewBottomY, width: kscreenW, height: 45))
//        scrollView.addSubview(surePwdItem)
//        let tumple4 = dataArr[4];
//        surePwdItem.titleLbl.text = tumple4.0
//        surePwdItem.textFiled.placeholder = tumple4.1
        
        inviteCodeItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: phoneCodeItem.viewBottomY, width: kscreenW, height: 45))
        scrollView.addSubview(inviteCodeItem)
        let tumples5 = dataArr[3];
        inviteCodeItem.titleLbl.text = tumples5.0
        inviteCodeItem.textFiled.placeholder = tumples5.1
        
        sureBtn = UIButton.init(frame: CGRect.init(x: 20, y: inviteCodeItem.viewBottomY + 20, width: kscreenW - 40, height: 45))
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.layer.cornerRadius = 4;
        sureBtn.layer.masksToBounds = true;
        sureBtn.backgroundColor = kThemeColor
        scrollView.addSubview(sureBtn)
        
        scrollView.contentSize = CGSize.init(width: kscreenW , height: sureBtn.viewBottomY + 30)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class JCRegistItem: UIView {
    
    var titleLbl:UILabel!
    var textFiled:UITextField!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = .white
        titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: 80, height: self.viewHeight));
        titleLbl.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(titleLbl)
        
        textFiled = UITextField.init(frame: CGRect.init(x: titleLbl.viewRightX + 10, y: 0, width: kscreenW - titleLbl.viewRightX - 10 - 20, height: self.viewHeight))
        textFiled.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(textFiled)
        
        let downline = UILabel.init(frame: CGRect.init(x: 0, y: self.viewHeight - 0.8, width: kscreenW, height: 0.8))
        downline.backgroundColor = kLineColor
        self.addSubview(downline)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class JCRegistItem2: UIView {
    
    var titleLbl:UILabel!
    var textFiled:UITextField!
    var clickBtn:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = .white
        titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: 80, height: self.viewHeight));
        titleLbl.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(titleLbl)
        
        textFiled = UITextField.init(frame: CGRect.init(x: titleLbl.viewRightX + 10, y: 0, width: kscreenW - titleLbl.viewX, height: self.viewHeight))
        textFiled.font = UIFont.systemFont(ofSize: 15)
        textFiled.isEnabled = false;
        self.addSubview(textFiled)
        
        clickBtn = UIButton.init(frame: CGRect.init(x: titleLbl.viewRightX + 10, y: 0, width: kscreenW - titleLbl.viewX, height: self.viewHeight))
        self.addSubview(clickBtn)
        
        let downline = UILabel.init(frame: CGRect.init(x: 0, y: self.viewHeight - 0.8, width: kscreenW, height: 0.8))
        downline.backgroundColor = kLineColor
        self.addSubview(downline)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
