//
//  JCViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/6/12.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import MJRefresh
import ObjectMapper

class JCFundDetailViewController: JCBaseViewController {
    
    var headerView:JCFundDetailMainTableHeaderView!
    var tableView:UITableView!
    var page = 1
    var headerModel:JCAccountDetailModel!
    var dataArr:[JCAccountDetailListModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "资金明细"
        self.initView()
        self.postAccountDetail()
        self.postAccountDetailList()
    }

    func initView(){
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)), style: UITableView.Style.plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        tableView.register(JCMyOrderTableViewCell.self, forCellReuseIdentifier: "JCMyOrderTableViewCell")
        self.view.addSubview(tableView)
        tableView.mj_header = MJRefreshNormalHeader()
        tableView.mj_footer = MJRefreshBackNormalFooter()
        tableView.mj_header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        tableView.mj_footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        headerView = JCFundDetailMainTableHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: 200))
        tableView.tableHeaderView = headerView;
    }
    
    @objc func headerRefresh() {
        page = 1
        self.postAccountDetailList()
    }
    
    @objc func footerRefresh() {
        page = page + 1;
        self.postAccountDetailList()
    }
    
    
    func postAccountDetail() {
        JCHttpClient.defult.sendPostRequest(path: "/api/app/account/accountDetail", parameter: ["":""], success: { (response) in
            let code:Int = response["code"] as! Int;
            if code == 0 {
                let dic = response["data"] as! [String:Any]
                self.headerModel = Mapper<JCAccountDetailModel>().map(JSONObject: dic)
                self.headerView.initData(dataModel: self.headerModel)
            } else {
                
            }
            
        }) { (error) in
            
        }
    }
    
    func postAccountDetailList() {
        let params = ["curPage":"\(page)","userId":"\(JCUserInfo.share.userId!)"];
        JCHttpClient.defult.sendPostRequest(path: "/api/app/account/list", parameter: params, success: { (response) in
            
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            if self.page == 1{
                self.dataArr.removeAll();
            }
            
            let code:Int = response["code"] as! Int;
            if code == 0 {
                let arr = response["data"] as! [[String:Any]]
                arr.forEach({
                    let model = Mapper<JCAccountDetailListModel>().map(JSONObject: $0)
                    self.dataArr.append(model!)
                })
                self.tableView.reloadData()
                
            } else {
                
            }
            
        }) { (error) in
            
        }
    }


}


extension JCFundDetailViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuserIdentifier = "JCMyOrderTableViewCell"
        let cell  = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier) as? JCMyOrderTableViewCell;
        cell?.configueData2(dataModel: self.dataArr[indexPath.row])
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
}
