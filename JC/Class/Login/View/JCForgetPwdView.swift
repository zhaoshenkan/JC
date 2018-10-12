
//
//  JCForgetPwdView.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCForgetPwdView: UIView {
   
    var scrollView:UIScrollView!
    var phoneItem:JCRegistItem!
    var phoneCodeItem:JCVerifyCodeItem!
    var pwdItem:JCRegistItem!
    var surePwdItem:JCRegistItem!
    var sureBtn:UIButton!

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var dataArr:[(String,String)] = [("手机号","请输入手机号"),
                                         ("验证码","请输入验证码"),
                                         ("设置密码","新密码"),
                                         ("确认密码","新密码")]
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight) - CGFloat(KTabbarSafeBottomMargin)))
        self.addSubview(scrollView)
        
        let itemHeight:CGFloat = 45;
        
        phoneItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: 20, width: kscreenW, height: itemHeight))
        scrollView.addSubview(phoneItem)
        let tumples1 = dataArr[0];
        phoneItem.titleLbl.text = tumples1.0
        phoneItem.textFiled.placeholder = tumples1.1
        
        phoneCodeItem = JCVerifyCodeItem.init(frame: CGRect.init(x: 0, y: phoneItem.viewBottomY, width: kscreenW, height: itemHeight))
        scrollView.addSubview(phoneCodeItem)
        let tumples2 = dataArr[1];
        phoneCodeItem.titleLbl.text = tumples2.0
        phoneCodeItem.textFiled.placeholder = tumples2.1
        
        pwdItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: phoneCodeItem.viewBottomY, width: kscreenW, height: itemHeight))
        scrollView.addSubview(pwdItem)
        let tumples3 = dataArr[2];
        pwdItem.titleLbl.text = tumples3.0
        pwdItem.textFiled.placeholder = tumples3.1
        
        surePwdItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: pwdItem.viewBottomY, width: kscreenW, height: itemHeight))
        scrollView.addSubview(surePwdItem)
        let tumple4 = dataArr[3];
        surePwdItem.titleLbl.text = tumple4.0
        surePwdItem.textFiled.placeholder = tumple4.1
        
        sureBtn = UIButton.init(frame: CGRect.init(x: 20, y: surePwdItem.viewBottomY + 20, width: kscreenW - 40, height: itemHeight))
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
