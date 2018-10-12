//
//  JCMessageDetailViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/11.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import ObjectMapper

class JCMessageDetailViewController: JCBaseViewController {
    
    var contentLbl:UILabel!
    var timeLbl:UILabel!
    var msgId:Int!
    var dataModel:JCMessageDetailModel!
    
    init(msgId:Int) {
        self.msgId = msgId ;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.postMsgDetail()
    
    }
    
    func postMsgDetail() {
        
        let paramas = ["id":"\(msgId!)",]
        JCHttpClient.defult.sendPostRequest(path: "/api/app/msg/detail", parameter: paramas, success: { (response) in
            let code:Int = response["code"] as! Int;
            if code == 0 {
                let dic = response["data"] as! [String:Any]
                self.dataModel = Mapper<JCMessageDetailModel>().map(JSONObject: dic)
                JCOCTool.setLabelHeightTitle(self.dataModel.noticeContent, fontSize: 14, lines: 0, label: self.contentLbl)
                self.timeLbl.frame = CGRect.init(x: kscreenW - 220, y: self.contentLbl.viewBottomY + 10, width: 200, height: 30);
                let time = JCTimeTool().Tranform(time: self.dataModel.createTime, type1: 1, type2: 1)
                self.timeLbl.text = time;
                
            } else {
                
            }
            
        }) { (error) in
            
        }
    }
    
    func initView()  {
        
        self.navigationItem.title = "详情"
        contentLbl = UILabel.init(frame: CGRect.init(x: 20, y: 10, width: kscreenW - 40, height: 150))
        contentLbl.textColor = UIColor.colorWith(hex: "333333")
        self.view.addSubview(contentLbl)
        
//        let text = "每月可免费提现一次,第二次开始每次提现需扣除1%手续费。提现预计1-3个工作日到账您绑定的银行卡账户每月可免费提现一次,第二次开始每次提现需扣除1%手续费。提现预计1-3个工作日到账您绑定的银行卡账户每月可免费提现一次,第二次开始每次提现需扣除1%手续费。提现预计1-3个工作日到账您绑定的银行卡账户每月可免费提现一次,第二次开始每次提现需扣除1%手续费。提现预计1-3个工作日到账您绑定的银行卡账户每月可免费提现一次,第二次开始每次提现需扣除1%手续费。提现预计1-3个工作日到账您绑定的银行卡账户每月可免费提现一次,第二次开始每次提现需扣除1%手续费。提现预计1-3个工作日到账您绑定的银行卡账户每月可免费提现一次,第二次开始每次提现需扣除1%手续费。提现预计1-3个工作日到账您绑定的银行卡账户"
//        JCOCTool.setLabelHeightTitle(text, fontSize: 14, lines: 0, label: contentLbl)
        
        
        timeLbl = UILabel.init(frame: CGRect.init(x: kscreenW - 220, y: contentLbl.viewBottomY + 10, width: 200, height: 30))
        timeLbl.textColor = UIColor.colorWith(hex: "333333")
        timeLbl.textAlignment = .right;
        self.view.addSubview(timeLbl)
//        timeLbl.text = "2018-01-01 17:00:00"
    }



}
