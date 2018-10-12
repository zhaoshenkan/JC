//
//  JCTrendTableViewCell.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/25.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCTrendTableViewCell: UITableViewCell {


    var titleLbl:UILabel!
    var timeLbl:UILabel!
    var numLbl:UILabel!
    var prizeLbl:UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initView()
    }
    
    func configData(dataModel:JCTrendModel)  {
        
        titleLbl.text = "\(dataModel.guessingName!)\(dataModel.termNumber!)"
        numLbl.text = "总投注:\(dataModel.totalBuy!)"
        let time = JCTimeTool().Tranform(time: dataModel.sellEndTime, type1: 1, type2: 1)
        timeLbl.text = "截止时间:\(time)"
        prizeLbl.text = "总中奖积分:\(dataModel.totalWin!)"
        
        if dataModel.totalWin > 0 {
            self.contentView.backgroundColor = .red;
            titleLbl.textColor = .black
            numLbl.textColor = .black
            timeLbl.textColor = .black
            prizeLbl.textColor = UIColor.black
        } else {
            self.contentView.backgroundColor = .black;
            titleLbl.textColor = .white
            numLbl.textColor = .white
            timeLbl.textColor = .white
            prizeLbl.textColor = .white
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        
        self.selectionStyle = .none
        
        titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 10, width: kscreenW/2, height: 25))
        titleLbl.font = UIFont.systemFont(ofSize: 14)
        titleLbl.textColor = UIColor.colorWith(hex: "333333")
        self.contentView.addSubview(titleLbl)
        
        numLbl = UILabel.init(frame: CGRect.init(x: 20, y: titleLbl.viewBottomY, width: kscreenW/2, height: 25))
        numLbl.font = UIFont.systemFont(ofSize: 14)
        numLbl.textColor = UIColor.colorWith(hex: "656565")
        self.contentView.addSubview(numLbl)
        
        timeLbl = UILabel.init(frame: CGRect.init(x: kscreenW/2, y: titleLbl.viewY, width: kscreenW/2, height: 25))
        timeLbl.font = UIFont.systemFont(ofSize: 14)
        timeLbl.textColor = UIColor.colorWith(hex: "656565")
        timeLbl.textAlignment = .right
        self.contentView.addSubview(timeLbl)
        
        prizeLbl = UILabel.init(frame: CGRect.init(x: kscreenW/2, y: titleLbl.viewBottomY, width: kscreenW/2, height: 25))
        prizeLbl.font = UIFont.systemFont(ofSize: 14)
        prizeLbl.textColor = UIColor.colorWith(hex: "656565")
        prizeLbl.textAlignment = .right
        self.contentView.addSubview(prizeLbl)
        
        let downline = UILabel.init(frame: CGRect.init(x: 0, y: 69.2, width: kscreenW, height: 0.8))
        downline.backgroundColor = kLineColor
        self.contentView.addSubview(downline)
        
    }}
