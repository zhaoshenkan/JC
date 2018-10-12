//
//  JCMyOrderDetailViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/9/18.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCMyOrderDetailViewController: JCBaseViewController {
    
    var orderId:Int = 0
    
    init(orderId:Int) {
        self.orderId = orderId ;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "订单详情";
        self.postOrderDetail()

    }
    
    func postOrderDetail() {
        let params = ["orderCode":"\(orderId)"];
        JCHttpClient.defult.sendPostRequest(path: "/api/app/guessing/userGuessingDetail", parameter: params, success: { (response) in
        
            let code:Int = response["code"] as! Int;
            if code == 0 {
         
            } else {
                
            }
            
        }) { (error) in
            
        }
    }

}
