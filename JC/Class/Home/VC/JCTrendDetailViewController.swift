//
//  JCTrendDetailViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/9/19.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCTrendDetailViewController: JCBaseViewController {
    
    var scrollView:UIScrollView!
    var typeItem:JCBottomPourItem!
    var noItem:JCBottomPourItem!
    var projectItem:JCBottomPourItem!
    var itemDesc:JCBottomPourItem!
    var startTimeItem:JCBottomPourItem!
    var endTimeItem:JCBottomPourItem!
    var lotteryItem:JCBottomPourItem!
    var perMoneyItem:JCBottomPourItem!
    var copiesItem:JCBottomPourItem!
    var multipItem:JCBottomPourItem!
    var planOneItem:JCBottomPourItem!
    var planTwoItem:JCBottomPourItem!
    var dataModel:JCTrendModel!
    
    init(dataModel:JCTrendModel) {
        self.dataModel = dataModel ;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "精彩单详情"
        self.initView()
        self.initData()

    }
    
    func initData()  {
        
        self.typeItem.contentLbl.text = dataModel.guessingName;
        self.noItem.contentLbl.text = dataModel.termNumber;
        self.projectItem.contentLbl.text = dataModel.guessingPlan;
        let time = JCTimeTool().Tranform(time: dataModel.sellStartTime, type1: 1, type2: 1)
        let time2 = JCTimeTool().Tranform(time: dataModel.sellEndTime, type1: 1, type2: 1)
        let time3 = JCTimeTool().Tranform(time: dataModel.openTime, type1: 1, type2: 1)
        self.startTimeItem.contentLbl.text = time;
        self.endTimeItem.contentLbl.text = time2;
        self.perMoneyItem.contentLbl.text = "\(dataModel.singlePrice!)积分";
        self.lotteryItem.contentLbl.text = time3;
        self.planOneItem.contentLbl.text = dataModel.planOne;
        self.planTwoItem.contentLbl.text = dataModel.planTwo;
        itemDesc.contentLbl.text = dataModel.planDesc
        copiesItem.contentLbl.text = "\(dataModel.totalBuy!)"
        multipItem.contentLbl.text = "\(dataModel.compensateRate!)"
        
    }
    
    
    func initView()  {
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.viewWidth, height: self.view.viewHeight))
        self.view.addSubview(scrollView);
        
        typeItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: 0, width: self.view.viewWidth, height: 40))
        typeItem.titleLbl.text = "合买类型"
        scrollView.addSubview(typeItem)
        
        noItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: typeItem.viewBottomY, width: self.view.viewWidth, height: 40))
        noItem.titleLbl.text = "合买期号"
        scrollView.addSubview(noItem)
        
        projectItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: noItem.viewBottomY, width: self.view.viewWidth, height: 40))
        projectItem.titleLbl.text = "合买方案"
        scrollView.addSubview(projectItem)
        
        itemDesc = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: projectItem.viewBottomY, width: self.view.viewWidth, height: 40))
        itemDesc.titleLbl.text = "方案描述"
        scrollView.addSubview(itemDesc)
        
        startTimeItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: itemDesc.viewBottomY, width: self.view.viewWidth, height: 40))
        startTimeItem.titleLbl.text = "开售时间"
        scrollView.addSubview(startTimeItem)
        
        endTimeItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: startTimeItem.viewBottomY, width: self.view.viewWidth, height: 40))
        endTimeItem.titleLbl.text = "截止时间"
        scrollView.addSubview(endTimeItem)
        
        lotteryItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: endTimeItem.viewBottomY, width: self.view.viewWidth, height: 40))
        lotteryItem.titleLbl.text = "开奖时间"
        scrollView.addSubview(lotteryItem)
        
        copiesItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: lotteryItem.viewBottomY, width: self.view.viewWidth, height: 40))
        copiesItem.titleLbl.text = "总投注"
        scrollView.addSubview(copiesItem)
        
        perMoneyItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: copiesItem.viewBottomY, width: self.view.viewWidth, height: 40))
        perMoneyItem.titleLbl.text = "单份投注"
        scrollView.addSubview(perMoneyItem)
    
        multipItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: perMoneyItem.viewBottomY, width: self.view.viewWidth, height: 40))
        multipItem.titleLbl.text = "倍率"
        scrollView.addSubview(multipItem)
        
        planOneItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: multipItem.viewBottomY, width: self.view.viewWidth, height: 40))
        planOneItem.titleLbl.text = "方案一"
        scrollView.addSubview(planOneItem)
        
        planTwoItem = JCBottomPourItem.init(frame: CGRect.init(x: 0, y: planOneItem.viewBottomY, width: self.view.viewWidth, height: 40))
        planTwoItem.titleLbl.text = "方案二"
        scrollView.addSubview(planTwoItem)
        
        scrollView.contentSize = CGSize.init(width: kscreenW, height: planTwoItem.viewBottomY)
    }


}
