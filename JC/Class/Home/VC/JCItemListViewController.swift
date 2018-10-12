//
//  JCItemListViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/9/12.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import MJRefresh
import ObjectMapper

class JCItemListViewController: JCBaseViewController {
    
    var tableView:UITableView!
    var page = 1
    var dataArr:[JCItemListModel] = []
    var itemId:String!
    var vcTitle:String!
    
    init(itemId:String,vcTitle:String) {
        self.itemId = itemId;
        self.vcTitle = vcTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView();
        self.postItemList()
    }
    
    func initView()  {
        
        self.navigationItem.title = self.vcTitle;
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)), style: UITableView.Style.plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        tableView.register(JCHomeTableViewCell.self, forCellReuseIdentifier: "home")
        self.view.addSubview(tableView)
        tableView.mj_header = MJRefreshNormalHeader()
        tableView.mj_footer = MJRefreshBackNormalFooter()
        tableView.mj_header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        tableView.mj_footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        
        let rightBtn = UIBarButtonItem.init(title: "走势图", style: .plain, target: self, action: #selector(pushTrendVc));
        rightBtn.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.colorWith(hex: "333333")], for: .normal)
        self.navigationItem.rightBarButtonItem = rightBtn;
    }
    
    @objc func pushTrendVc() {
        self.navigationController?.pushViewController(JCTrendViewController(guessCode:itemId), animated: true)
    }
    
    @objc func headerRefresh() {
        page = 1
        self.postItemList()
    }
    
    @objc func footerRefresh() {
        page = page + 1;
        self.postItemList()
    }
    
    func postItemList() {
        
        let paramas = ["curPage":"\(page)",
                       "guessingCode":"\(itemId!)"]
        JCHttpClient.defult.sendPostRequest(path: "/api/app/guessing/guessingList", parameter: paramas , success: { (response) in
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            if self.page == 1{
                self.dataArr.removeAll();
            }
            let code:Int = response["code"] as! Int;
            if code == 0 {
                let arr = response["data"] as! [[String:Any]]
                arr.forEach({
                    let model = Mapper<JCItemListModel>().map(JSONObject: $0)
                    self.dataArr.append(model!)
                })
                self.tableView.reloadData()
            } else {
                
            }
            
        }) { (error) in
            
        }
    }
    
}

extension JCItemListViewController:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let reuserIdentifier = "home"
        let cell  = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier) as? JCHomeTableViewCell;
        cell?.configData(dataModel: dataArr[indexPath.row])
        return cell!;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataModel:JCItemListModel = self.dataArr[indexPath.row];
        let vc =  JCBottomPourViewController()
        vc.itemId = dataModel.itemId;
        self.navigationController?.pushViewController(vc, animated: true)

    }
}
