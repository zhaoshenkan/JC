//
//  JCMeViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import ObjectMapper

class JCMeViewController: JCBaseViewController {
    
    var tableView:UITableView!
    var logoutBtn:UIButton!
    var headerView:JCMeTableviewHeaderView!
    var dataModle:JCMeModel!
    var dataArr:[[(String,String,String)]] = [[("身份认证","bank","3"),("可用积分","balance","2"),("积分兑换","withdraw","1")],[("我的订单","order","1"),("资金明细","detail","1"),("风险计算器","calculator","1")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "个人中心";
        self.initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.postUserInfo()
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func initData()  {
        headerView.userNameLbl.text = JCUserInfo.share.userName;
        headerView.avatarImgView.set(name: headerView.userNameLbl.text!)
        self.tableView.reloadData()
    }
    
    func initView()  {
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(ktabBarH)), style: UITableView.Style.grouped)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        tableView.sectionHeaderHeight = 5
        tableView.sectionFooterHeight = 5
        tableView.register(JCMeTableViewCell.self, forCellReuseIdentifier: "JCMeTableViewCell")
        self.view.addSubview(tableView)
        
        headerView = JCMeTableviewHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: CGFloat(120 + kstatusBarH)))
        tableView.tableHeaderView = headerView;
        
        let footView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: 80))
        logoutBtn = UIButton.init(frame: CGRect.init(x: 20, y: 20, width: kscreenW - 40, height: 40))
        logoutBtn.setTitle("退出登录", for: .normal)
        logoutBtn.layer.cornerRadius = 4;
        logoutBtn.layer.masksToBounds = true;
        logoutBtn.backgroundColor = kThemeColor
        logoutBtn.addTarget(self, action: #selector(logout), for: .touchUpInside)
        footView.addSubview(logoutBtn)
        tableView.tableFooterView = footView;
    }
    
    @objc func logout() {
        
        let alert = UIAlertController(title: "确认注销账号？", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "退出", style: .default, handler: { (action) in
            
            JCHttpClient.defult.sendPostRequest(path: "/api/app/user/logout", parameter: ["":""], success: { (response) in
                let code:Int = response["code"] as! Int;
                if code == 0 {
                    JCUserInfo.share.clearData()
                    let controller: JCNaviViewController? = JCNaviViewController(rootViewController: JCLoginViewController())
                    UIApplication.shared.keyWindow?.rootViewController = controller;
                } else {
                    
                }
                
            }) { (error) in
                
            }
            
     
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func postUserInfo()  {
        JCHttpClient.defult.sendPostRequest(path: "/api/app/user/userInfo", parameter: ["":""], success: { (response) in

            let code:Int = response["code"] as! Int;
            if code == 0 {
                let dic = response["data"] as! [String:Any]
                self.dataModle = Mapper<JCMeModel>().map(JSONObject: dic)
                UserDefaults.standard.setValue(self.dataModle.userName, forKey: "userName")
                UserDefaults.standard.setValue(self.dataModle.mobile, forKey: "mobile")
                UserDefaults.standard.setValue("\(self.dataModle.userId!)", forKey: "userId")
                UserDefaults.standard.setValue("\(self.dataModle.account!)", forKey: "account")
                self.initData()

            } else {
                
            }

        }) { (error) in

        }
    }

}

extension JCMeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = self.dataArr[section];
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuserIdentifier = "JCMeTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier) as? JCMeTableViewCell;
        let arr = self.dataArr[indexPath.section];
        let tumpel = arr[indexPath.row]
        cell?.titleImgView.image = UIImage.init(named: tumpel.1)
        cell?.titleLbl.text = tumpel.0
        cell?.set(style: tumpel.2)
        if tumpel.0 == "可用积分" {
            cell?.contentLbl.text = JCUserInfo.share.account;
        }
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let arr = self.dataArr[indexPath.section];
        let tumpel = arr[indexPath.row]
        if tumpel.0 == "身份认证" {
            self.navigationController?.pushViewController(JCBindBankCardViewController(), animated: true)
        } else if tumpel.0 == "风险计算器" {
            self.navigationController?.pushViewController(JCCaculatorViewController(), animated: true)
        } else if tumpel.0 == "我的订单" {
            self.navigationController?.pushViewController(JCMyOrderViewController(), animated: true)
        } else if tumpel.0 == "资金明细" {
            self.navigationController?.pushViewController(JCFundDetailViewController(), animated: true)
        } else if tumpel.0 == "充值" {
            self.navigationController?.pushViewController(JCRechargeViewController(), animated: true)
        } else if tumpel.0 == "积分兑换" {
            self.navigationController?.pushViewController(JCWithdrawViewController(), animated: true)
        }
        
    }
}
