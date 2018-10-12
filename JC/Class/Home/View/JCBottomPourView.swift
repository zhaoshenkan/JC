//
//  JCBottomPourView.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/10.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCBottomPourView: UIView {
    
    var scrollView:UIScrollView!
    var typeItem:JCBottomPourItem!
    var noItem:JCBottomPourItem!
    var projectItem:JCBottomPourItem!
    var startTimeItem:JCBottomPourItem!
    var endTimeItem:JCBottomPourItem!
    var lotteryItem:JCBottomPourItem!
    var perMoneyItem:JCBottomPourItem!
    var copiesItem:JCBottomPourItem!
    var planOneItem:JCBottomPourItem!
    var planTwoItem:JCBottomPourItem!
    var bottomPourItem:JCRegistItem!
    var agreeBtn:UIButton!
    var protocolBtn:UIButton!
    var sureBtn:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    func configData(dataModel:JCBottomPourDataModel) {
        
        typeItem.contentLbl.text = dataModel.orderType;
        noItem.contentLbl.text = dataModel.periodOrderNo;
        startTimeItem.contentLbl.text = JCTimeTool().Tranform(time: dataModel.sellBegainTime, type1: 1, type2: 2)
        endTimeItem.contentLbl.text = JCTimeTool().Tranform(time: dataModel.sellEndTime, type1: 1, type2: 2)
        lotteryItem.contentLbl.text = JCTimeTool().Tranform(time: dataModel.publishTime, type1: 1, type2: 2);
        perMoneyItem.contentLbl.text = "￥\(dataModel.amountPer)"
        copiesItem.contentLbl.text = "\(dataModel.amountTotal)"

    }
    
    func initView(){
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: self.viewWidth, height: self.viewHeight))
        self.addSubview(scrollView);
        
        typeItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: 0, width: self.viewWidth, height: 40))
        typeItem.titleLbl.text = "合买类型"
        scrollView.addSubview(typeItem)
        
        noItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: typeItem.viewBottomY, width: self.viewWidth, height: 40))
        noItem.titleLbl.text = "合买期号"
        scrollView.addSubview(noItem)
        
        projectItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: noItem.viewBottomY, width: self.viewWidth, height: 40))
        projectItem.titleLbl.text = "合买方案"
        scrollView.addSubview(projectItem)
        
        startTimeItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: projectItem.viewBottomY, width: self.viewWidth, height: 40))
        startTimeItem.titleLbl.text = "开售时间"
        scrollView.addSubview(startTimeItem)
        
        endTimeItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: startTimeItem.viewBottomY, width: self.viewWidth, height: 40))
        endTimeItem.titleLbl.text = "截止时间"
        scrollView.addSubview(endTimeItem)
        
        lotteryItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: endTimeItem.viewBottomY, width: self.viewWidth, height: 40))
        lotteryItem.titleLbl.text = "开奖时间"
        scrollView.addSubview(lotteryItem)
        
        perMoneyItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: lotteryItem.viewBottomY, width: self.viewWidth, height: 40))
        perMoneyItem.titleLbl.text = "单份金额"
        scrollView.addSubview(perMoneyItem)
        
        copiesItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: perMoneyItem.viewBottomY, width: self.viewWidth, height: 40))
        copiesItem.titleLbl.text = "剩余份数"
        scrollView.addSubview(copiesItem)
        
        let downline = UILabel.init(frame: CGRect.init(x: 0, y: copiesItem.viewBottomY, width: kscreenW, height: 0.8))
        downline.backgroundColor = kLineColor
        self.addSubview(downline)
        
        planOneItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: copiesItem.viewBottomY, width: self.viewWidth, height: 40))
        planOneItem.titleLbl.text = "方案一"
        planOneItem.isHidden = true
        scrollView.addSubview(planOneItem)
        
        planTwoItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: planOneItem.viewBottomY, width: self.viewWidth, height: 40))
        planTwoItem.titleLbl.text = "方案二"
        planTwoItem.isHidden = true
        scrollView.addSubview(planTwoItem)
        
        bottomPourItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: downline.viewBottomY, width: self.viewWidth, height: 40))
        bottomPourItem.titleLbl.text = "参与份数"
        bottomPourItem.titleLbl.textColor = .red;
        bottomPourItem.textFiled.placeholder = "请输入下注份数"
        bottomPourItem.textFiled.keyboardType = .numberPad
        scrollView.addSubview(bottomPourItem)
        
        agreeBtn = UIButton.init(frame: CGRect.init(x: 20, y: bottomPourItem.viewBottomY + 10, width: 25, height: 25))
        agreeBtn.setBackgroundImage(#imageLiteral(resourceName: "checkbox_sel"), for: .selected)
        agreeBtn.setBackgroundImage(#imageLiteral(resourceName: "checkbox_unsel"), for: .normal)
        scrollView.addSubview(agreeBtn)
        
        protocolBtn = UIButton.init(frame: CGRect.init(x: agreeBtn.viewRightX, y: bottomPourItem.viewBottomY + 5, width: 120, height: 35))
        let attrStr:NSMutableAttributedString = NSMutableAttributedString.init(string: "同意《竞猜协议》")
        attrStr.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.colorWith(hex: "656565")], range: NSMakeRange(0, 2))
        attrStr.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], range: NSMakeRange(0, 2))
        attrStr.addAttributes([NSAttributedString.Key.foregroundColor: kThemeColor], range: NSMakeRange(2, 6))
        attrStr.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], range: NSMakeRange(2, 6))
        protocolBtn.setAttributedTitle(attrStr, for: .normal)
        scrollView.addSubview(protocolBtn)
        
        sureBtn = UIButton.init(frame: CGRect.init(x: 20, y: protocolBtn.viewBottomY + 20, width: kscreenW - 40, height: 45))
        sureBtn.setTitle("下注", for: .normal)
        sureBtn.backgroundColor = kThemeColor;
        sureBtn.layer.cornerRadius = 4;
        sureBtn.layer.masksToBounds = true;
        scrollView.addSubview(sureBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



class JCBottomPourItem: UIView {
    
    var titleLbl:UILabel!
    var contentLbl:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: 80, height: 40));
        titleLbl.font = UIFont.systemFont(ofSize: 15)
        titleLbl.textColor = UIColor.colorWith(hex: "656565")
        self.addSubview(titleLbl)
        
        contentLbl = UILabel.init(frame: CGRect.init(x: kscreenW - 220, y: 0, width: 200, height: 40));
        contentLbl.font = UIFont.systemFont(ofSize: 15)
        contentLbl.textAlignment = .right
        contentLbl.textColor = UIColor.colorWith(hex: "656565")
        self.addSubview(contentLbl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
