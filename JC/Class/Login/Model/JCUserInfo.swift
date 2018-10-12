//
//  JCUserInfo.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/6.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation


class JCUserInfo :NSObject  {
    
    static let share = JCUserInfo()
    private override init() {
        // 单例模式，防止出现多个实例
    }

    
    func clearData() {
        UserDefaults.standard.setValue(nil, forKey: "token")
        UserDefaults.standard.setValue(nil, forKey: "userName")
        UserDefaults.standard.setValue(nil, forKey: "mobile")
        UserDefaults.standard.setValue(nil, forKey: "userId")
        UserDefaults.standard.setValue(nil, forKey: "account")
    }
    
    var token:String! {
        get {
            guard let token = UserDefaults.standard.value(forKey: "token") else {
                return ""
            }
            return token as? String
        }
    }
    
    var userName:String! {
        get {
            guard let userName = UserDefaults.standard.value(forKey: "userName") else {
                return ""
            }
            return userName as? String
        }
    }
    
    var mobile:String! {
        get {
            guard let mobile = UserDefaults.standard.value(forKey: "mobile") else {
                return ""
            }
            return mobile as? String
        }
    }
    
    var userId:String! {
        get {
            guard let userId = UserDefaults.standard.value(forKey: "userId") else {
                return ""
            }
            return userId as? String
        }
    }
    
    var account:String! {
        get {
            guard let account = UserDefaults.standard.value(forKey: "account") else {
                return ""
            }
            return account as? String
        }
    }
    
}
