//
//  JCMessageTableViewCell.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/25.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCMessageTableViewCell: UITableViewCell {
    
    var titleImg:UIImageView!
    var titleLbl:UILabel!
    var contentLbl:UILabel!
    var timeLbl:UILabel!
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initView()
        self.selectionStyle = .none
        titleImg.backgroundColor = kThemeColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configData(model:JCMessageModel) {
        titleLbl.text = model.noticeName
        let time = JCTimeTool().Tranform(time: model.createTime, type1: 1, type2: 1)
        timeLbl.text = time
        contentLbl.text = "内容是********************************"

    }
    
    func initView(){
        
        titleImg = UIImageView.init(frame: CGRect.init(x: 20, y: 10, width: 50, height: 50))
        titleImg.layer.cornerRadius = 25;
        titleImg.layer.masksToBounds = true;
        self.contentView.addSubview(titleImg)
        
        titleLbl = UILabel.init(frame: CGRect.init(x: titleImg.viewRightX + 20, y: titleImg.viewY, width: 150, height: 25))
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
        
        let downline = UILabel.init(frame: CGRect.init(x: titleLbl.viewX, y: 59.2, width: kscreenW - titleLbl.viewX, height: 0.8))
        downline.backgroundColor = kLineColor
        self.contentView.addSubview(downline)
        
    }

}
