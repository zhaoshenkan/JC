//
//  JCTrendModel.swift
//  JC
//
//  Created by 赵申侃 on 2018/9/19.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation
import ObjectMapper


struct JCTrendModel:Mappable {
    
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
    var totalBuy:Int!
    var totalWin:Int!
    var updateTime:String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        compensateRate  <- map["compensateRate"]
        createTime  <- map["createTime"]
        guessingCode  <- map["guessingCode"]
        guessingName  <- map["guessingName"]
        guessingPlan  <- map["guessingPlan"]
        id  <- map["id"]
        openTime  <- map["openTime"]
        planDesc  <- map["planDesc"]
        planOne  <- map["planOne"]
        planTwo  <- map["planTwo"]
        sellEndTime  <- map["sellEndTime"]
        sellStartTime  <- map["sellStartTime"]
        singlePrice  <- map["singlePrice"]
        status  <- map["status"]
        termNumber  <- map["termNumber"]
        totalBuy  <- map["totalBuy"]
        totalWin  <- map["totalWin"]
        updateTime  <- map["updateTime"]
    }
    
}
