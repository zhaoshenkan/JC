//
//  JCFundDetailMainView.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/12.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCFundDetailMainTableHeaderView: UIView {
    
    var balanceItem:JCBottomPourItem!
    var inputItem:JCBottomPourItem!
    var withdrawalItem:JCBottomPourItem!
    var rechargeItem:JCBottomPourItem!
    var gainItem:JCBottomPourItem!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initData(dataModel:JCAccountDetailModel) {
        
        balanceItem.contentLbl.text = "\(dataModel.account!)";
        inputItem.contentLbl.text = "\(dataModel.closeMoney!)"
        withdrawalItem.contentLbl.text = "\(dataModel.withdrawMoney!)"
        rechargeItem.contentLbl.text = "\(dataModel.rechargeMoney!)"
        gainItem.contentLbl.text = "\(dataModel.winMoney!)"
        
    }
    
    func initView()  {
        balanceItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: 0, width: self.viewWidth, height: 40))
        balanceItem.titleLbl.text = "当前积分"
        self.addSubview(balanceItem)
        
        inputItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: balanceItem.viewBottomY, width: self.viewWidth, height: 40))
        inputItem.titleLbl.text = "未开奖投入"
        self.addSubview(inputItem)
        
        withdrawalItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: inputItem.viewBottomY, width: self.viewWidth, height: 40))
        withdrawalItem.titleLbl.text = "总提现积分"
        self.addSubview(withdrawalItem)
        
        rechargeItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: withdrawalItem.viewBottomY, width: self.viewWidth, height: 40))
        rechargeItem.titleLbl.text = "总充值积分"
        self.addSubview(rechargeItem)
        
        gainItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: rechargeItem.viewBottomY, width: self.viewWidth, height: 40))
        gainItem.titleLbl.text = "总盈利情况"
        self.addSubview(gainItem)
    }
    
}
