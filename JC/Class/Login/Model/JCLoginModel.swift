//
//  JCLoginModel.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/6.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation


struct JCLoginModel: Codable {
    
    var data:String!
    var extra:JCLoginExtraModel!
    var code:Int!
    var msg:String!
}

struct JCLoginExtraModel : Codable{
    
    var center:JCLoginCenterModel!
    var userCode:String!
    var inviteCode:String!
}

struct JCLoginCenterModel: Codable {
    
    var balance:String!
    var phone:String!
    var bankCardNo:String!
    var userName:String!
    var authenticated:Bool!
}


