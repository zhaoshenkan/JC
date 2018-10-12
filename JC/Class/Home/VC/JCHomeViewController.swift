//
//  JCHomeViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/8.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh

class JCHomeViewController: JCBaseViewController {
    
    var tableView:UITableView!
    var page = 0
    var dataArr:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "合买大厅";
        self.initView()
        self.postGuessingItems();

    }
    
    func initView()  {
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(ktabBarH) - CGFloat(kNaviBarHeight)), style: UITableView.Style.plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        tableView.rowHeight = 100;
        tableView.register(JCItemTableViewCell.self, forCellReuseIdentifier: "JCItemTableViewCell")
        self.view.addSubview(tableView)

    }
    

    func postGuessingItems() {
        
        let paramas = ["curPage":"0","guessingCode":"0"]
        JCHttpClient.defult.sendPostRequest(path: "/api/app/guessing/guessingItem", parameter: paramas, success: { (response) in
            let code:Int = response["code"] as! Int;
            if code == 0 {
                self.dataArr = response["data"] as! [[String:String]];
                self.tableView.reloadData()
            } else {

            }
            
        }) { (error) in
            
        }

    }
}

extension JCHomeViewController:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let reuserIdentifier = "JCItemTableViewCell"
        let cell  = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier) as? JCItemTableViewCell;
        let dic:[String:String] = dataArr[indexPath.row];
        cell?.titleLbl.text = dic["guessingCodeName"]
        return cell!;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic:[String:String] = dataArr[indexPath.row];
        self.navigationController?.pushViewController(JCItemListViewController(itemId: dic["guessingCode"]!,vcTitle:dic["guessingCodeName"]!), animated: true);

    }
}
