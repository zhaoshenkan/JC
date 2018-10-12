//
//  JCTimeTool.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation


struct JCTimeTool {
    
    func Tranform(time:String,type1:Int,type2:Int) -> String {
        let dateformatter1 = DateFormatter()
        if type1 == 1 {
            dateformatter1.dateFormat = "yyyyMMddHHmmss"
        }
        let date = dateformatter1.date(from: time)
        
        let dateformatter = DateFormatter()
        if type2 == 1 {//04-04 18:00
            dateformatter.dateFormat = "MM-dd HH:mm"
        } else if type2 == 2 {
            dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        }
        return dateformatter.string(from: date!)
    }
    
    
}
