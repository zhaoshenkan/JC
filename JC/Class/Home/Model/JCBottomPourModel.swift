//
//  JCBottomPourModel.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation

struct JCBottomPourModel: Codable {
    
    var data:JCBottomPourDataModel!
    var extra:String!
    var code:Int!
    var msg:String!
}


struct JCBottomPourDataModel: Codable {
    
    var periodOrderNo:String!
    var orderType:String!
    var sellBegainTime:String!
    var sellEndTime:String!
    var publishTime:String!
    var payTime:String!
    var payType:String!
    var amountPer:Int = 0
    var quantity:Int!
    var amountTotal:Int = 0
    var buyOrderState:Int!

}
