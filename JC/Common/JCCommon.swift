//
//  JCCommon.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation
import UIKit


let kscreenW = UIScreen.main.bounds.width
let kscreenH = UIScreen.main.bounds.height

let Iphone4:Bool! = (UIScreen.main.bounds.size.height == 960/2) ? true : false
let Iphone5:Bool! = (UIScreen.main.bounds.size.height == 1136/2) ? true : false
let Iphone6:Bool! = (UIScreen.main.bounds.size.height == 1334/2) ? true : false
let Iphone6p:Bool! = (UIScreen.main.bounds.size.height == 2208/2) ? true : false
let Iphonex:Bool! = (UIScreen.main.bounds.size.height == 812) ? true : false

let kstatusBarH = (Iphonex ? 44: 20)
let ktabBarH = (Iphonex ? 49 + 34: 49)
let KTabbarSafeBottomMargin :Int = (Iphonex ? 34 : 0)
let kNaviBarHeight = (Iphonex ? 88 : 64)
let kViewHeight = kscreenH - CGFloat(kNaviBarHeight)

let kBcgColor = UIColor.colorWith(hex: "F1F5F6")
let kLineColor = UIColor.colorWith(hex: "E9EDF1")
let kThemeColor = UIColor.colorWith(hex: "FF8020")
let kUnSelColor = UIColor.colorWith(hex: "A6B3BE")

let kBaseUrl = "http://121.40.210.210:8080/event-platform-admin"
let kBaseUrl2 = "http://47.92.166.116"
