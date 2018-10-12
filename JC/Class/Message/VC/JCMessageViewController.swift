//
//  JCMessageViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import ObjectMapper
import MJRefresh

class JCMessageViewController: JCBaseViewController {
    
    var tableView:UITableView!
    var vcType:Int = 1
    var page:Int = 1;
    var dataArr:[JCMessageModel] = []
    
    init(vcType:Int) {
        self.vcType = vcType ;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.postMsgList()
    }
    
    func initView()  {
        
        if vcType == 1 {
            self.navigationItem.title = "系统通知"
        } else {
            self.navigationItem.title = "系统通告"
        }

        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(ktabBarH) - CGFloat(kNaviBarHeight)), style: UITableView.Style.plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        tableView.register(JCMessageTableViewCell.self, forCellReuseIdentifier: "JCMessageTableViewCell")
        self.view.addSubview(tableView)
        tableView.mj_header = MJRefreshNormalHeader()
        tableView.mj_footer = MJRefreshBackNormalFooter()
        tableView.mj_header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        tableView.mj_footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
    }
    
    @objc func headerRefresh() {
        page = 1
        self.postMsgList()
    }
    
    @objc func footerRefresh() {
        page = page + 1;
        self.postMsgList()
    }
    
    
    func postMsgList() {
        
        let paramas = ["curPage":"\(page)","msgType":"\(vcType)"]
        JCHttpClient.defult.sendPostRequest(path: "/api/app/msg/list", parameter: paramas, success: { (response) in
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            if self.page == 1{
                self.dataArr.removeAll();
            }
            let code:Int = response["code"] as! Int;
            if code == 0 {
                let arr = response["data"] as! [[String:Any]]
                arr.forEach({
                    let model = Mapper<JCMessageModel>().map(JSONObject: $0)
                    self.dataArr.append(model!)
                })
                self.tableView.reloadData()
            } else {
                
            }
            
        }) { (error) in
            
        }
    }

}

extension JCMessageViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuserIdentifier = "JCMessageTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier) as? JCMessageTableViewCell;
        cell?.configData(model: self.dataArr[indexPath.row])
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model:JCMessageModel = self.dataArr[indexPath.row]
        self.navigationController?.pushViewController(JCMessageDetailViewController(msgId: model.id!), animated: true)
    }
}
