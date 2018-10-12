//
//  JCMyOrderTableViewCell.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/25.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCMyOrderTableViewCell: UITableViewCell {

    var titleLbl:UILabel!
    var contentLbl:UILabel!
    var timeLbl:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initView()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configtData(dataModel:JCMyOrderModel) {
        titleLbl.text = dataModel.guessingName;
        if (dataModel.createTime != nil) {
            let time = JCTimeTool().Tranform(time: dataModel.createTime, type1: 1, type2: 1)
            timeLbl.text = time
        }
        contentLbl.text = "\(dataModel.buyAccount!)积分"
    }
    
    func configueData2(dataModel:JCAccountDetailListModel)  {
        
        //1 买 2 充值 3提现 4 中奖返现
        if dataModel.type == 1 {
            titleLbl.text = "竞猜支出"
        }  else if dataModel.type == 2 {
            titleLbl.text = "积分收入"
        } else if dataModel.type == 3 {
            titleLbl.text = "积分兑换"
        } else if dataModel.type == 4 {
            titleLbl.text = "积分收入"
        }

        if (dataModel.createTime != nil) {
            let time = JCTimeTool().Tranform(time: dataModel.createTime, type1: 1, type2: 1)
            timeLbl.text = time
        }
        contentLbl.text = "\(dataModel.money!)积分"
        
    }
    
    func initView(){
        self.selectionStyle = .none
        titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 10, width: 200, height: 30))
        titleLbl.font = UIFont.systemFont(ofSize: 16)
        titleLbl.textColor = UIColor.colorWith(hex: "333333")
        self.contentView.addSubview(titleLbl)
        
        contentLbl = UILabel.init(frame: CGRect.init(x: titleLbl.viewX, y: titleLbl.viewBottomY, width: kscreenW - titleLbl.viewX, height: 15))
        contentLbl.font = UIFont.systemFont(ofSize: 13)
        contentLbl.textColor = UIColor.colorWith(hex: "656565")
        self.contentView.addSubview(contentLbl)
        
        timeLbl = UILabel.init(frame: CGRect.init(x: kscreenW - 100, y: titleLbl.viewY, width: 90, height: 25))
        timeLbl.font = UIFont.systemFont(ofSize: 12)
        timeLbl.textColor = UIColor.colorWith(hex: "656565")
        self.contentView.addSubview(timeLbl)
        
        let downline = UILabel.init(frame: CGRect.init(x: 0, y: 59.2, width: kscreenW, height: 0.8))
        downline.backgroundColor = kLineColor
        self.contentView.addSubview(downline)
    }

}
