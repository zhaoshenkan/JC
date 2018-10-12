//
//  JCMeModel.swift
//  JC
//
//  Created by 赵申侃 on 2018/7/9.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation
import ObjectMapper

struct JCMeModel:Mappable  {
    
    var account:Int!
    var mobile:String!
    var userId:Int!
    var userName:String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        account  <- map["account"]
        mobile  <- map["mobile"]
        userId  <- map["userId"]
        userName  <- map["userName"]
    }
}


