//
//  JCBindBankCardView.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/16.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCBindBankCardView: UIView {
    
    var bankItem:JCRegistItem2!
    var cardNumItem:JCRegistItem!
    var userNameItem:JCRegistItem!
    var verifyCode:JCVerifyCodeItem!
    var idCardBtn:UIButton!
    var idCardBtn2:UIButton!
    var sureBtn:UIButton!
    var scrollView:UIScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var dataArr:[(String,String)] = [("银行","请选择银行"),
                                         ("银行卡号","请输入银行卡号"),
                                         ("持卡人姓名","请输入持卡人姓名"),
                                         ("验证码","请输入验证码")]
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)))
        self.addSubview(scrollView)
        
        let itemHeight:CGFloat = 45
        
        bankItem = JCRegistItem2.init(frame: CGRect.init(x: 0, y: 20, width: kscreenW, height: itemHeight))
        scrollView.addSubview(bankItem)
        let tumples3 = dataArr[0];
        bankItem.titleLbl.text = tumples3.0
        bankItem.textFiled.placeholder = tumples3.1
        
        cardNumItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: bankItem.viewBottomY, width: kscreenW, height: itemHeight))
        scrollView.addSubview(cardNumItem)
        let tumples = dataArr[1];
        cardNumItem.titleLbl.text = tumples.0
        cardNumItem.textFiled.placeholder = tumples.1
        
        userNameItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: cardNumItem.viewBottomY, width: kscreenW, height: itemHeight))
        scrollView.addSubview(userNameItem)
        let tumples1 = dataArr[2];
        userNameItem.titleLbl.text = tumples1.0
        userNameItem.textFiled.placeholder = tumples1.1
        
        verifyCode = JCVerifyCodeItem.init(frame: CGRect.init(x: 0, y: userNameItem.viewBottomY, width: kscreenW, height: itemHeight))
        scrollView.addSubview(verifyCode)
        let tumples2 = dataArr[3];
        verifyCode.titleLbl.text = tumples2.0
        verifyCode.textFiled.placeholder = tumples2.1
        
        idCardBtn = UIButton.init(frame: CGRect.init(x: 20, y: verifyCode.viewBottomY + 20, width: 100, height: 80))
        idCardBtn.backgroundColor = .white
        idCardBtn.setTitle("身份证正面", for: .normal)
        idCardBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        idCardBtn.setTitleColor(UIColor.colorWith(hex: "333333"), for: .normal)
        idCardBtn.setImage(#imageLiteral(resourceName: "idCard"), for: .normal)
        idCardBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 20, bottom: 20, right: 20)
        idCardBtn.titleEdgeInsets = UIEdgeInsets.init(top: 60, left: -80, bottom: 0, right: -10)
        idCardBtn.layer.cornerRadius = 4;
        idCardBtn.layer.masksToBounds = true;
        scrollView.addSubview(idCardBtn)
        
        idCardBtn2 = UIButton.init(frame: CGRect.init(x: idCardBtn.viewRightX + 20, y: verifyCode.viewBottomY + 20, width: 100, height: 80))
        idCardBtn2.setTitle("银行卡正面", for: .normal)
        idCardBtn2.backgroundColor = .white
        idCardBtn2.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        idCardBtn2.setTitleColor(UIColor.colorWith(hex: "333333"), for: .normal)
        idCardBtn2.setImage(#imageLiteral(resourceName: "bank_card2"), for: .normal)
        idCardBtn2.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 25, bottom: 20, right: 20)
        idCardBtn2.titleEdgeInsets = UIEdgeInsets.init(top: 60, left: -60, bottom: 0, right: -10)
        idCardBtn2.layer.cornerRadius = 4;
        idCardBtn2.layer.masksToBounds = true;
        scrollView.addSubview(idCardBtn2)
        
        sureBtn = UIButton.init(frame: CGRect.init(x: 20, y: idCardBtn2.viewBottomY + 20, width: kscreenW - 40, height: 45))
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.backgroundColor = kThemeColor;
        sureBtn.layer.cornerRadius = 4;
        sureBtn.layer.masksToBounds = true;
        scrollView.addSubview(sureBtn)

        scrollView.contentSize = CGSize.init(width: kscreenW, height: sureBtn.viewBottomY)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


