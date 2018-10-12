//
//  JCItemListModel.swift
//  JC
//
//  Created by 赵申侃 on 2018/9/17.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation
import ObjectMapper


struct JCItemListModel:Mappable {
    
    var compensateRate:String!
    var createTime:String!
    var guessingCode:String!
    var guessingName:String!
    var guessingPlan:String!
    var itemId:Int!
    var openTime:String!
    var planOne:String!
    var planTwo:String!
    var sellEndTime:String!
    var sellStartTime:String!
    var singlePrice:Float!
    var status:Int!
    var statusName:String!
    var termNumber:String!
    var updateTime:String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        compensateRate  <- map["compensateRate"]
        createTime  <- map["createTime"]
        guessingCode  <- map["guessingCode"]
        guessingName  <- map["guessingName"]
        guessingPlan  <- map["guessingPlan"]
        itemId  <- map["id"]
        openTime  <- map["openTime"]
        planOne  <- map["planOne"]
        planTwo  <- map["planTwo"]
        sellEndTime  <- map["sellEndTime"]
        sellStartTime  <- map["sellStartTime"]
        singlePrice  <- map["singlePrice"]
        status  <- map["status"]
        statusName  <- map["statusName"]
        termNumber  <- map["termNumber"]
        updateTime  <- map["updateTime"]
    }
    
}
