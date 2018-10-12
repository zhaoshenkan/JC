//
//  JCMessageModel.swift
//  JC
//
//  Created by 赵申侃 on 2018/9/18.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation
import ObjectMapper

struct JCMessageModel:Mappable {
    
    var createTime:String!
    var id:Int!
    var noticeName:String!
    var top:Int!
    var type:Int!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        createTime  <- map["createTime"]
        id  <- map["id"]
        noticeName  <- map["noticeName"]
        top  <- map["top"]
        type  <- map["type"]
    }
    
}


struct JCMessageDetailModel:Mappable {
    
    var createTime:String!
    var id:Int!
    var noticeName:String!
    var top:Int!
    var type:Int!
    var noticeContent:String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        createTime  <- map["createTime"]
        id  <- map["id"]
        noticeName  <- map["noticeName"]
        top  <- map["top"]
        type  <- map["type"]
        noticeContent  <- map["noticeContent"]
    }
    
}
