//
//  JCAccountDetailModel.swift
//  JC
//
//  Created by 赵申侃 on 2018/9/18.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation
import ObjectMapper


struct JCAccountDetailModel:Mappable {
    
    var account:Int!
    var closeMoney:Int!
    var rechargeMoney:Int!
    var winMoney:Int!
    var withdrawMoney:Int!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        account  <- map["account"]
        closeMoney  <- map["closeMoney"]
        rechargeMoney  <- map["rechargeMoney"]
        winMoney  <- map["winMoney"]
        withdrawMoney  <- map["withdrawMoney"]

    }
    
}


struct JCAccountDetailListModel:Mappable {
    
    var createTime:String!
    var id:Int!
    var money:Int!
    //1 买 2 充值 3提现 4 中奖返现
    var type:Int!
    var finishTime:String!
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        createTime  <- map["createTime"]
        id  <- map["id"]
        money  <- map["money"]
        type  <- map["type"]
        finishTime  <- map["finishTime"]
    }
    
}
