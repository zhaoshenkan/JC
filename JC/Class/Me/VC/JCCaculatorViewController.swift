//
//  JCCaculatorViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/24.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCCaculatorViewController: JCBaseViewController {
    
    var scrollView:UIScrollView!
    var headerView:JCCalculatorHeaderView!
    var tableView:UITableView!
    var sureBtn:UIButton!
    var dataArr:[(String,String,String,String,String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "风险计算器"
        self.initView()

    }

    func initView() {
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)))
        self.view.addSubview(scrollView)
        
        headerView = JCCalculatorHeaderView.init(frame: CGRect.init(x: 0, y: 20, width: kscreenW, height: 120))
        headerView.mathItem.clickBtn.addTarget(self, action: #selector(selMath), for: .touchUpInside)
        scrollView.addSubview(headerView)
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: headerView.viewBottomY + 5, width: kscreenW, height: CGFloat(40*(dataArr.count + 1))), style: UITableView.Style.plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.isScrollEnabled = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        tableView.register(JCCalculatorTableViewCell.self, forCellReuseIdentifier: "JCCalculatorTableViewCell")
        scrollView.addSubview(tableView)
        
        let tableViewHeaderView = JCCalculatorTableViewHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: 40))
        tableView.tableHeaderView = tableViewHeaderView;
        
        sureBtn = UIButton.init(frame: CGRect.init(x: 20, y: tableView.viewBottomY + 20, width: kscreenW - 40, height: 45))
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.backgroundColor = kThemeColor;
        sureBtn.layer.cornerRadius = 4;
        sureBtn.layer.masksToBounds = true;
        sureBtn.addTarget(self, action: #selector(cancluator), for: .touchUpInside)
        scrollView.addSubview(sureBtn)
        
        scrollView.contentSize = CGSize.init(width: kscreenW, height: sureBtn.viewBottomY)
    }
    
    @objc func selMath()  {
        let actionSheet: UIActionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil)
        let mathArr:[String] = ["公式翻", "两倍翻", "三倍翻"]
        mathArr.map({
            actionSheet.addButton(withTitle: $0)
        })
        actionSheet.show(in: self.view)
    }
    
    @objc func cancluator() {
        dataArr.removeAll()
        if ((self.headerView.baseNumItem.textFiled.text?.count)! <= 0) {
            MBProgressHUD.showError("请输入基数")
        } else if ((self.headerView.oddsItem.textFiled.text?.count)! <= 0) {
           MBProgressHUD.showError("请输入赔率")
        } else if ((self.headerView.mathItem.textFiled.text?.count)! <= 0) {
            MBProgressHUD.showError("请选择算法")
        }
        let indexArr:[Int] = [0,1,2,3,4,5,6,7,8,9];
        let baseNum:Int = Int(self.headerView.baseNumItem.textFiled.text!)!
        let oddsNum:Int = Int(self.headerView.oddsItem.textFiled.text!)!
        var math:Int = 0;
        if self.headerView.mathItem.textFiled.text == "公式翻" {
            math = 2
        } else if self.headerView.mathItem.textFiled.text == "两倍翻" {
            math = 2;
        } else if self.headerView.mathItem.textFiled.text == "三倍翻" {
            math = 3
        }
        var tumples:(String,String,String,String,String) = ("0","\(baseNum/2)","0","0","0")
        
        indexArr.map { (index:Int) in
            tumples = self.cancluatorData(index: index, baseNum: baseNum, oddsNum: oddsNum, math: math, tumples: tumples)
            dataArr.append(tumples)
            print(index)
        }
        tableView.frame = CGRect.init(x: 0, y: headerView.viewBottomY + 5, width: kscreenW, height: CGFloat(40*(dataArr.count + 1)))
        sureBtn.frame = CGRect.init(x: 20, y: tableView.viewBottomY + 20, width: kscreenW - 40, height: 45)
        self.tableView.reloadData()
    }
    
    func cancluatorData(index:Int,baseNum:Int,oddsNum:Int,math:Int,tumples:(String,String,String,String,String)) -> (String,String,String,String,String) {
        var tumplesData:(String,String,String,String,String) = ("0","0","0","0","0")
        tumplesData.0 = "\(index)"
        tumplesData.1 = "\(Int(tumples.1)!*math)"
        let result = Int(tumplesData.1)! + Int(tumples.2)!
        tumplesData.2 = "\(result)"
        tumplesData.3 = "\(Int(tumplesData.1)!*oddsNum)";
        tumplesData.4 = "\(Int(tumplesData.3)! - Int(tumplesData.2)!)"
        return tumplesData
    }

}

extension JCCaculatorViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuserIdentifier = "JCCalculatorTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier) as? JCCalculatorTableViewCell;
        cell?.configData(tumples: dataArr[indexPath.row])
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40;
    }
    
}

extension JCCaculatorViewController: UIActionSheetDelegate {
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == 0 {
            return
        }
        self.headerView.mathItem.textFiled.text = actionSheet.buttonTitle(at: buttonIndex)!
    }
}
