//
//  JCMyOrderViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/25.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import MJRefresh
import ObjectMapper

class JCMyOrderViewController: JCBaseViewController {
    
    var tableView:UITableView!
    var page:Int = 1
    var dataArr:[JCMyOrderModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.postMyOrderList()
    }
    
    func initView() {
        self.navigationItem.title = "我的订单"
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
    }
    
    func postMyOrderList() {
        
        let params = ["curPage":"\(page)","userId":JCUserInfo.share.userId!];
        JCHttpClient.defult.sendPostRequest(path: "/api/app/guessing/myGuessingList", parameter: params, success: { (response) in
            
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            if self.page == 1{
                self.dataArr.removeAll();
            }
            
            let code:Int = response["code"] as! Int;
            if code == 0 {
                let arr = response["data"] as! [[String:Any]]
                arr.forEach({
                    let model = Mapper<JCMyOrderModel>().map(JSONObject: $0)
                    self.dataArr.append(model!)
                })
                self.tableView.reloadData()
            } else {
                
            }
            
        }) { (error) in
            
        }
    }
    
    @objc func headerRefresh() {
        page = 1
        self.postMyOrderList()
    }
    
    @objc func footerRefresh() {
        page = page + 1;
        self.postMyOrderList()
    }

}

extension JCMyOrderViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuserIdentifier = "JCMyOrderTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier) as? JCMyOrderTableViewCell;
        cell?.configtData(dataModel: self.dataArr[indexPath.row])
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataArr[indexPath.row]
        self.navigationController?.pushViewController(JCMyOrderDetailViewController(orderId:model.id), animated: true);
    }
}
