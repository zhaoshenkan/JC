//
//  JCWithdrawView.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/12.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCWithdrawView: UIView {
    
    var balanceItem:JCBottomPourItem!
    var withdrawItem:JCRegistItem!
    var sureBtn:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 5, width: kscreenW - 40, height: 150))
        let text = "每月可免费提现一次,第二次开始每次提现需扣除1%手续费。提现预计1-3个工作日到账您绑定的银行卡账户"
        titleLbl.textColor = UIColor.colorWith(hex: "333333")
        self.addSubview(titleLbl)
        JCOCTool.setLabelHeightTitle(text, fontSize: 14, lines: 0, label: titleLbl)
        
        balanceItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: titleLbl.viewBottomY + 20, width: kscreenW, height: 45))
        balanceItem.titleLbl.text = "当前金额"
        self.addSubview(balanceItem)
        
        let downline = UILabel.init(frame: CGRect.init(x: 0, y: balanceItem.viewBottomY, width: kscreenW, height: 0.8))
        self.addSubview(downline)
        
        withdrawItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: balanceItem.viewBottomY, width: kscreenW, height: 45))
        withdrawItem.titleLbl.textColor = UIColor.colorWith(hex: "656565")
        withdrawItem.textFiled.textColor = UIColor.colorWith(hex: "656565")
        withdrawItem.titleLbl.text = "兑换积分"
        withdrawItem.textFiled.textAlignment = .right;
        withdrawItem.textFiled.placeholder = "输入你要兑换的积分"
        withdrawItem.textFiled.keyboardType = .numberPad
        self.addSubview(withdrawItem)
        
        sureBtn = UIButton.init(frame: CGRect.init(x: 20, y: withdrawItem.viewBottomY + 20, width: kscreenW - 40, height: 45))
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.backgroundColor = kThemeColor;
        sureBtn.layer.cornerRadius = 4;
        sureBtn.layer.masksToBounds = true;
        self.addSubview(sureBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
