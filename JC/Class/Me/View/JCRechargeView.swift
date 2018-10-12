//
//  JCRechargeView.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/12.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCRechargeView: UIView {
    
    var scrollView:UIScrollView!
    var balanceItem:JCBottomPourItem!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)))
        self.addSubview(scrollView)
        
        let titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 5, width: kscreenW - 40, height: 20))
        let text = "只接受真实姓名,备注好登录手机号和认证的真实姓名"
        titleLbl.textColor = UIColor.colorWith(hex: "333333")
        scrollView.addSubview(titleLbl)
        JCOCTool.setLabelHeightTitle(text, fontSize: 12, lines: 0, label: titleLbl)
        
        balanceItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: titleLbl.viewBottomY, width: kscreenW, height: 40))
        balanceItem.titleLbl.text = "可用余额"
        scrollView.addSubview(balanceItem)
        
        let bankView = JCRechargeBankInfoView.init(frame: CGRect.init(x: 0, y: balanceItem.viewBottomY, width: kscreenW, height: 50 + 45*3))
        scrollView.addSubview(bankView)
        bankView.titleLbl.text = "建设银行"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class JCRechargeBankInfoView: UIView {
    
    var titleLbl:UILabel!
    var userNameItem:JCBottomPourItem!
    var bankItem:JCBottomPourItem!
    var addressItem:JCBottomPourItem!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLbl = UILabel.init(frame: CGRect.init(x: 0, y: 10, width: kscreenW, height: 30))
        titleLbl.textColor = UIColor.colorWith(hex: "333333")
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(titleLbl)
        
        userNameItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: titleLbl.viewBottomY + 10, width: kscreenW, height: 45))
        userNameItem.titleLbl.text = "收款姓名"
        self.addSubview(userNameItem)
        
        bankItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: userNameItem.viewBottomY , width: kscreenW, height: 45))
        bankItem.titleLbl.text = "收款账号"
        self.addSubview(bankItem)
        
        addressItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: bankItem.viewBottomY , width: kscreenW, height: 45))
        addressItem.titleLbl.text = "开户地址"
        self.addSubview(addressItem)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
