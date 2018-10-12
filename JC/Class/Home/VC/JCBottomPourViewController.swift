//
//  JCBottomPourViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/10.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import ObjectMapper

class JCBottomPourViewController: JCBaseViewController {
    
    var bottomPourView:JCBottomPourView!
    var dataModel:JCBottomPour2Model!
    var itemId:Int!
    var isAgree:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.postOrderDetail()
    }
    
    func initView()  {
        self.navigationItem.title = "合买详情"
        bottomPourView = JCBottomPourView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)))
        bottomPourView.sureBtn.addTarget(self, action: #selector(postPurchase), for: .touchUpInside)
        bottomPourView.agreeBtn.addTarget(self, action: #selector(agreeProtocol(btn:)), for: .touchUpInside)
        bottomPourView.protocolBtn.addTarget(self, action: #selector(agreeProtocol(btn:)), for: .touchUpInside)
        self.view.addSubview(bottomPourView)
        
        bottomPourView.bottomPourItem.isHidden = true;
        bottomPourView.agreeBtn.isHidden = true;
        bottomPourView.protocolBtn.isHidden = true;
        bottomPourView.sureBtn.isHidden = true;
        
        let rightBtn = UIBarButtonItem.init(title: "风险计算器", style: .plain, target: self, action: #selector(pushCalculator));
        rightBtn.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.colorWith(hex: "333333")], for: .normal)
        self.navigationItem.rightBarButtonItem = rightBtn;
    }
    
    func initData()  {
        bottomPourView.typeItem.contentLbl.text = dataModel.guessingName;
        bottomPourView.noItem.contentLbl.text = dataModel.termNumber;
        bottomPourView.projectItem.contentLbl.text = dataModel.guessingPlan;
        let time = JCTimeTool().Tranform(time: dataModel.sellStartTime, type1: 1, type2: 1)
        let time2 = JCTimeTool().Tranform(time: dataModel.sellEndTime, type1: 1, type2: 1)
        let time3 = JCTimeTool().Tranform(time: dataModel.openTime, type1: 1, type2: 1)
        bottomPourView.startTimeItem.contentLbl.text = time;
        bottomPourView.endTimeItem.contentLbl.text = time2;
        bottomPourView.perMoneyItem.contentLbl.text = "￥\(dataModel.singlePrice!)";
        bottomPourView.lotteryItem.contentLbl.text = time3;
        bottomPourView.planOneItem.contentLbl.text = dataModel.planOne;
        bottomPourView.planTwoItem.contentLbl.text = dataModel.planTwo;
        
        if dataModel.status == 1 {
            bottomPourView.bottomPourItem.isHidden = true;
            bottomPourView.agreeBtn.isHidden = true;
            bottomPourView.protocolBtn.isHidden = true
            bottomPourView.sureBtn.isHidden = true;
            bottomPourView.planTwoItem.isHidden = true;
            bottomPourView.planOneItem.isHidden = true;
            
        } else if dataModel.status == 2 {
            bottomPourView.bottomPourItem.isHidden = false;
            bottomPourView.agreeBtn.isHidden = false;
            bottomPourView.protocolBtn.isHidden = false;
            bottomPourView.sureBtn.isHidden = false;
            bottomPourView.planTwoItem.isHidden = true;
            bottomPourView.planOneItem.isHidden = true;
            
        } else if dataModel.status == 3 {
            bottomPourView.bottomPourItem.isHidden = true;
            bottomPourView.agreeBtn.isHidden = true;
            bottomPourView.protocolBtn.isHidden = true
            bottomPourView.sureBtn.isHidden = true;
            bottomPourView.planTwoItem.isHidden = false;
            bottomPourView.planOneItem.isHidden = false;
            
        } else if dataModel.status == 4 {
            bottomPourView.bottomPourItem.isHidden = true;
            bottomPourView.agreeBtn.isHidden = true;
            bottomPourView.protocolBtn.isHidden = true
            bottomPourView.sureBtn.isHidden = true;
            bottomPourView.planTwoItem.isHidden = false;
            bottomPourView.planOneItem.isHidden = false;
            
        } else if dataModel.status == 5 {
            bottomPourView.bottomPourItem.isHidden = true;
            bottomPourView.agreeBtn.isHidden = true;
            bottomPourView.protocolBtn.isHidden = true
            bottomPourView.sureBtn.isHidden = true;
            bottomPourView.planTwoItem.isHidden = false;
            bottomPourView.planOneItem.isHidden = false;
        }
    }
    
    @objc func agreeProtocol(btn:UIButton) {
        
        isAgree = !isAgree;
        bottomPourView.agreeBtn.isSelected =  isAgree;
    }
    
    func postOrderDetail() {
        
        let parmas = ["id":"\(itemId!)"]
        JCHttpClient.defult.sendPostRequest(path: "/api/app/guessing/detail", parameter: parmas , success: { (response) in
            let code:Int = response["code"] as! Int;
            if code == 0 {
                let dic = response["data"] as! [String:Any]
                self.dataModel = Mapper<JCBottomPour2Model>().map(JSONObject: dic)
                self.initData();
            } else {
                
            }
            
        }) { (error) in
            
        }
    }
    
    @objc func postPurchase() {
        
        if (bottomPourView.bottomPourItem.textFiled.text?.count)! <= 0 {
            return MBProgressHUD .showError("请输入你要下注的分数")
        }
        guard isAgree == true else {
            return MBProgressHUD .showError("请先同意协议")
        }
        
        let count = Int(bottomPourView.bottomPourItem.textFiled.text ?? "0") ?? 0;
        let parmas = ["id":"\(itemId!)","buyCount":"\(count)"];
        JCHttpClient.defult.sendPostRequest(path: "/api/app/guessing/buy", parameter: parmas , success: { (response) in
            let code:Int = response["code"] as! Int;
            if code == 0 {
                self.navigationController?.popViewController(animated: true);
            } else {
                
            }
            
        }) { (error) in
            
        }
        
    }

    @objc func pushCalculator() {
        self.navigationController?.pushViewController(JCCaculatorViewController(), animated: true)
    }

}
