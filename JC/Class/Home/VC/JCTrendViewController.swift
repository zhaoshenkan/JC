//
//  JCTrendViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/25.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import ObjectMapper

class JCTrendViewController: JCBaseViewController {
    
    var tableView:UITableView!
    var guessCode:String!
    var dataArr:[JCTrendModel] = []
    
    init(guessCode:String) {
        self.guessCode = guessCode;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "红黑走势图"
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)), style: UITableView.Style.plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        tableView.register(JCTrendTableViewCell.self, forCellReuseIdentifier: "JCTrendTableViewCell")
        self.view.addSubview(tableView)
        self.postTrendData()
    }
    
    func postTrendData()  {
        
        let paramas = ["guessingCode":guessCode!]
        JCHttpClient.defult.sendPostRequest(path: "/api/app/guessing/tendency", parameter: paramas, success: { (response) in
            let code:Int = response["code"] as! Int;
            if code == 0 {
                let arr = response["data"] as! [[String:Any]]
                arr.forEach({
                    let model = Mapper<JCTrendModel>().map(JSONObject: $0)
                    self.dataArr.append(model!)
                })
                self.tableView.reloadData()
            } else {
                
            }
            
        }) { (error) in
            
        }
        
    }
}

extension JCTrendViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuserIdentifier = "JCTrendTableViewCell"
        let cell   = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier) as? JCTrendTableViewCell;
        cell?.configData(dataModel: self.dataArr[indexPath.row])
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(JCTrendDetailViewController(dataModel: self.dataArr[indexPath.row]), animated: true)
        
    }
}
