//
//  JCHomeTableViewCell.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import SnapKit

class JCHomeTableViewCell: UITableViewCell {
    
    var titleLbl:UILabel!
    var stateLbl:UILabel!
    var jcNoLbl:UILabel!
    var endTimeLbl:UILabel!
    var titleImg:UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initView()
        titleImg.backgroundColor = kThemeColor
    }
    
    func configData(dataModel:JCItemListModel) {
        titleLbl.text = dataModel.guessingName;
        stateLbl.text = dataModel.statusName;
        let time = JCTimeTool().Tranform(time: dataModel.sellEndTime, type1: 1, type2: 1)
        endTimeLbl.text = "截止:\(time)"
        jcNoLbl.text = dataModel.termNumber;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        
        self.selectionStyle = .none
        self.contentView.backgroundColor = .white
        
        titleImg = UIImageView.init()
        titleImg.backgroundColor = kThemeColor
        titleImg.contentMode = .scaleAspectFit;
        self.contentView.addSubview(titleImg)
        
        titleLbl = UILabel.init()
        titleLbl.font = UIFont.systemFont(ofSize: 16);
        titleLbl.textColor = UIColor.colorWith(hex: "333333")
        self.contentView.addSubview(titleLbl)
        
        stateLbl = UILabel.init()
        stateLbl.font = UIFont.systemFont(ofSize: 13);
        stateLbl.textColor = UIColor.colorWith(hex: "666666")
        self.contentView.addSubview(stateLbl)
        
        jcNoLbl = UILabel.init()
        jcNoLbl.font = UIFont.systemFont(ofSize: 13);
        jcNoLbl.textColor = UIColor.colorWith(hex: "333333")
        jcNoLbl.textAlignment = .right;
        self.contentView.addSubview(jcNoLbl)
        
        endTimeLbl = UILabel.init()
        endTimeLbl.font = UIFont.systemFont(ofSize: 13);
        endTimeLbl.textColor = UIColor.colorWith(hex: "666666")
        endTimeLbl.textAlignment = .right;
        self.contentView.addSubview(endTimeLbl)
        
        let downline = UILabel.init()
        downline.backgroundColor = kLineColor
        self.contentView.addSubview(downline)
        
        titleImg.snp.makeConstraints { (make) in
            make.width.height.equalTo(60);
            make.centerY.equalTo(self);
            make.left.equalTo(20)
        }
        
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalTo(titleImg.snp.right).offset(20);
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.top.equalTo(titleImg)
        }
        
        stateLbl.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(titleLbl)
            make.top.equalTo(titleLbl.snp.bottom).offset(10)
        }
        
        jcNoLbl.snp.makeConstraints { (make) in
            make.top.width.height.equalTo(titleLbl)
            make.right.equalTo(self).offset(-20)
        }
        
        endTimeLbl.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-20)
            make.top.height.equalTo(stateLbl)
            make.width.equalTo(120)
        }
        
        downline.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(0.8)
        }
        
    }

}
