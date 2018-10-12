//
//  JCLoginModel2.swift
//  JC
//
//  Created by zhaoshenkan on 2018/8/19.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation

struct JCLoginModel2: Codable {
    
    var data:JCLoginModelData2!
    var code:Int!
}

struct JCLoginModelData2: Codable {
    var userToken:String!
}

