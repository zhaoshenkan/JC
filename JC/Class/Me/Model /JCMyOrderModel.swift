//
//  JCMyOrderModel.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/11.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation
import ObjectMapper


struct JCMyOrderModel :Mappable {
    
    var buyAccount:Int!
    var compensateRate:Int!
    var createTime:String!
    var guessingCode:String!
    var guessingName:String!
    var guessingPlan:String!
    var id:Int!
    var openTime:String!
    var planDesc:String!
    var planOne:String!
    var planTwo:String!
    var sellEndTime:String!
    var sellStartTime:String!
    var singlePrice:Int!
    var status:Int!
    var termNumber:String!
    var updateTime:String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        buyAccount  <- map["buyAccount"]
        compensateRate  <- map["compensateRate"]
        createTime  <- map["createTime"]
        guessingCode  <- map["guessingCode"]
        guessingName  <- map["guessingName"]
        guessingPlan  <- map["guessingPlan"]
        id  <- map["id"]
        planDesc  <- map["planDesc"]
        planOne  <- map["planOne"]
        planTwo  <- map["planTwo"]
        sellEndTime  <- map["sellEndTime"]
        sellStartTime  <- map["sellStartTime"]
        singlePrice  <- map["singlePrice"]
        status  <- map["status"]
        termNumber  <- map["termNumber"]
        updateTime  <- map["updateTime"]
    }
    
}

