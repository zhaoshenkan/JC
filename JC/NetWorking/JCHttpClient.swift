//
//  JCHttpClient.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/25.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import Foundation
import Alamofire


class JCHttpClient: NSObject {
    
    static let defult = JCHttpClient()
    
    private override init() {
        // 单例模式，防止出现多个实例
    }
    
    func getRequestWithURL(path :String,parameter:Parameters, success: @escaping (_ result: Data) -> Void ,failure: @escaping (_ error: Error) -> Void ) -> Void {
        let requestUrl = kBaseUrl + path;
        let httpHeaders: HTTPHeaders =  ["Content-Type": "application/json"]
        
        print(" requst = \(requestUrl)\n params = \(parameter)")
        
        Alamofire.request(requestUrl, method: .get, parameters: parameter, encoding: JSONEncoding.default,headers:httpHeaders).responseJSON { response in
            print("response = \(response)")
            if response.error != nil {
                failure(response.error!)
                return;
            }
            
//            if let JSON = response.result.value {
//                success(JSON as! [String: AnyObject])
//            }
            if let JSON = (response.result.value as? [String : AnyObject]) {
                print("json = \(JSON)")
                
                if let code = (JSON["code"] as? Int) {
                    if code == 1 {
                        
                        let data = try? JSONSerialization.data(withJSONObject: JSON, options: [])
                        let str = String(data: data!, encoding: String.Encoding.utf8)
                        let jsonData = str?.data(using: .utf8)
                        success(jsonData!)
                        
                        
                    } else if code  == -200 || code  == -300{
                        MBProgressHUD.showError(JSON["msg"] as! String)
                    } else {
                        print("服务器返回错误：\(JSON["msg"] as! String)")
                    }
                }
                
            }
            return
        }
    }
    
    func postRequestWithURL(path :String,parameter:Parameters, complection: @escaping (_ result: Data) -> Void,failure: @escaping (_ error: Error) -> Void  ) -> Void {
        
        let requestUrl = kBaseUrl + path;
        var httpHeaders: HTTPHeaders =  ["Content-Type": "application/json"]
        if let token = JCUserInfo.share.token {
            httpHeaders =  ["Content-Type": "application/json","Authorization":token]
        }
        

        print(" requst = \(requestUrl)\n params = \(parameter)")

        Alamofire.request(requestUrl, method: .post, parameters: parameter, encoding: JSONEncoding.default,headers:httpHeaders).responseJSON { response in
            print("response = \(response)")
            if response.error != nil {
                failure(response.error!)
                return;
            }
            
            if let JSON = (response.result.value as? [String : AnyObject]) {
                print("json = \(JSON)")
                
                if let code = (JSON["code"] as? Int) {
                    if code == 1 {
                        
                        let data = try? JSONSerialization.data(withJSONObject: JSON, options: [])
                        let str = String(data: data!, encoding: String.Encoding.utf8)
                        let jsonData = str?.data(using: .utf8)
                        complection(jsonData!)
                        
                        
                    } else if code  == -200 || code  == -300 {
                        MBProgressHUD.showError(JSON["msg"] as! String)
                    } else {
                        print("服务器返回错误：\(JSON["msg"] as! String)")
                    }
                }
                
            }
        }
    }
    
    func postRequestWithFormData(path :String,parameter:Parameters, complection: @escaping (_ result: Data) -> Void,failure: @escaping (_ error: Error) -> Void  ) -> Void {
        
        let requestUrl = kBaseUrl + path;
        var httpHeaders: HTTPHeaders =  ["Content-Type": "application/json"];
        if let token = JCUserInfo.share.token {
            httpHeaders =  ["Content-Type": "application/json","Authorization":token]
        }
        
        print(" requst = \(requestUrl)\n params = \(parameter)")
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameter {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            }

        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: requestUrl, method: .post, headers: httpHeaders) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                //连接服务器成功后，对json的处理
                upload.responseJSON { response in
                    
                    if response.error != nil {
                        failure(response.error!)
                        return;
                    }
                    
                    if let JSON = (response.result.value as? [String : AnyObject]) {
                        print("json = \(JSON)")
                        
                        if let code = (JSON["code"] as? Int) {
                            if code == 1 {
                                
                                let data = try? JSONSerialization.data(withJSONObject: JSON, options: [])
                                let str = String(data: data!, encoding: String.Encoding.utf8)
                                let jsonData = str?.data(using: .utf8)
                                complection(jsonData!)
                                
                            } else if code  == -200  || code  == -300{
                                MBProgressHUD.showError(JSON["msg"] as! String)
                            } else {
                                print("服务器返回错误：\(JSON["msg"] as! String)")
                            }
                        }

                    }
        
                }

            case .failure(let encodingError):
                //打印连接失败原因
                print(encodingError)
            }
        }
        
    }
    
    func postRequestImageWithFormData(path :String,parameter:Parameters, complection: @escaping (_ result: Data) -> Void,failure: @escaping (_ error: Error) -> Void  ) -> Void {
        
        let requestUrl = kBaseUrl + path;
        var httpHeaders: HTTPHeaders =  ["Content-Type": "application/json"];
        if let token = JCUserInfo.share.token {
            httpHeaders =  ["Content-Type": "application/json","Authorization":token]
        }
        
        print(" requst = \(requestUrl)\n params = \(parameter)")
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameter {
                if (value as! String).hasPrefix("/var"){
                    multipartFormData.append(NSURL.fileURL(withPath: value as! String), withName: "files", fileName: "\(key).png", mimeType: "image/png")
                } else {
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: requestUrl, method: .post, headers: httpHeaders) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                //连接服务器成功后，对json的处理
                upload.responseJSON { response in
                    
                    if response.error != nil {
                        failure(response.error!)
                        return;
                    }
                    
                    if let JSON = (response.result.value as? [String : AnyObject]) {
                        print("json = \(JSON)")
                        
                        if let code = (JSON["code"] as? Int) {
                            if code == 1 {
                                
                                let data = try? JSONSerialization.data(withJSONObject: JSON, options: [])
                                let str = String(data: data!, encoding: String.Encoding.utf8)
                                let jsonData = str?.data(using: .utf8)
                                complection(jsonData!)
                                
                            } else if code  == -200  || code  == -300{
                                MBProgressHUD.showError(JSON["msg"] as! String)
                            } else {
                                print("服务器返回错误：\(JSON["msg"] as! String)")
                            }
                        }
                        
                    }
                }
                
            case .failure(let encodingError):
                //打印连接失败原因
                print(encodingError)
            }
        }
        
    }
    
    func sendPostRequest(path :String,parameter:Parameters, success: @escaping (_ result: [String : Any]) -> Void ,failure: @escaping (_ error: Error) -> Void ) -> Void {
        let requestUrl = kBaseUrl2 + path;
        var signStr:String = "";
       
        let arr:[String] = parameter.keys.sorted()
        for key in arr {
            signStr = signStr + "\(key)\(parameter[key]!)";
        }

        var httpHeaders: HTTPHeaders;
        if !JCUserInfo.share.token.isEmpty {
            signStr = String.md5(signStr + "userToken" + JCUserInfo.share.token)();
            httpHeaders =  ["Content-Type":"application/json","appType":"1","appVersion":"1.0.0","signature":signStr,"userToken":JCUserInfo.share.token]
        } else {
            signStr = String.md5(signStr + "userTokennull")();
            httpHeaders =  ["Content-Type":"application/json","appType":"1","appVersion":"1.0.0","signature":signStr];
        }
        
        print(" requst = \(requestUrl)\n params = \(parameter) \n httpHeader = \(httpHeaders)")
        
        Alamofire.request(requestUrl, method: .post, parameters: parameter, encoding: JSONEncoding.default,headers:httpHeaders).responseJSON { response in
            print("response = \(response)")
            if response.error != nil {
                failure(response.error!)
                return;
            }
            
            if let JSON = (response.result.value as? [String : AnyObject]) {
                success(JSON)
            }
            return
        }
    }
    
    func postRequest3WithURL(path :String,parameter:Parameters, success: @escaping (_ result: Data) -> Void ,failure: @escaping (_ error: Error) -> Void ) -> Void {
        let requestUrl = kBaseUrl2 + path;
        var signStr:String = "";
        for (key, value) in parameter {
            signStr = signStr + "\(key)\(value)";
        }
        var httpHeaders: HTTPHeaders;
        if !JCUserInfo.share.token.isEmpty {
            signStr = String.md5(signStr + "userToken" + JCUserInfo.share.token)();
            httpHeaders =  ["Content-Type":"application/json","appType":"1","appVersion":"1.0.0","signature":signStr,"userToken":JCUserInfo.share.token]
        } else {
            signStr = String.md5(signStr + "userTokennull")();
            httpHeaders =  ["Content-Type":"application/json","appType":"1","appVersion":"1.0.0","signature":signStr];
        }
        
        print(" requst = \(requestUrl)\n params = \(parameter) \n httpHeader = \(httpHeaders)")
        
        Alamofire.request(requestUrl, method: .post, parameters: parameter, encoding: JSONEncoding.default,headers:httpHeaders).responseJSON { response in
            print("response = \(response)")
            if response.error != nil {
                failure(response.error!)
                return;
            }
    
            if let JSON = (response.result.value as? [String : AnyObject]) {
                print("json = \(JSON)")
                
                if let code = (JSON["code"] as? Int) {
                    if code == 0 {
                        let data = try? JSONSerialization.data(withJSONObject: JSON, options: [])
                        let str = String(data: data!, encoding: String.Encoding.utf8)
                        let jsonData = str?.data(using: .utf8)
                        success(jsonData!)
                    }
                }
            
            }
            return
        }
    }
    
}



