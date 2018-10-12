//
//  JCCalculatorHeaderView.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/24.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCCalculatorHeaderView: UIView {
    var baseNumItem:JCRegistItem!
    var oddsItem:JCRegistItem!
    var mathItem:JCRegistItem2!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView()  {
        
        var itemArr:[(String,String)] = [("基数","请输入基数"),
                                         ("赔率","请输入赔率"),
                                         ("算法","请选择算法")]
        
        baseNumItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: 40))
        self.addSubview(baseNumItem)
        let tumples = itemArr[0];
        baseNumItem.titleLbl.text = tumples.0
        baseNumItem.textFiled.placeholder = tumples.1
        
        oddsItem = JCRegistItem.init(frame: CGRect.init(x: 0, y: baseNumItem.viewBottomY, width: kscreenW, height: 40))
        self.addSubview(oddsItem)
        let tumples1 = itemArr[1];
        oddsItem.titleLbl.text = tumples1.0
        oddsItem.textFiled.placeholder = tumples1.1
        
        mathItem = JCRegistItem2.init(frame: CGRect.init(x: 0, y: oddsItem.viewBottomY, width: kscreenW, height: 40))
        self.addSubview(mathItem)
        let tumples2 = itemArr[2];
        mathItem.titleLbl.text = tumples2.0
        mathItem.textFiled.placeholder = tumples2.1
   
        
    }
    
  

}

class JCCalculatorTableViewHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView()  {
        
        let dataArr = ["脸黑","当天投入","累计投入","中奖","利润"];
        for (index,str) in dataArr.enumerated() {
            let x:CGFloat = CGFloat(index)*kscreenW/5
            let titleLbl = UILabel.init(frame:CGRect.init(x: x, y: 0, width: kscreenW/5, height: 40));
            titleLbl.text = str;
            titleLbl.font = UIFont.systemFont(ofSize: 15)
            titleLbl.textColor = UIColor.colorWith(hex: "656565")
            titleLbl.textAlignment = .center
            self.addSubview(titleLbl)
            
            let downline = UILabel.init(frame: CGRect.init(x: x, y:0 , width: 0.8, height: 40))
            downline.backgroundColor = kLineColor
            self.addSubview(downline)
        }
        
        let downline1 = UILabel.init(frame: CGRect.init(x: 0, y:39.2 , width: kscreenW, height: 0.8))
        downline1.backgroundColor = kLineColor
        self.addSubview(downline1)
    }
}

class JCCalculatorTableViewCell: UITableViewCell {
    
    var label1:UILabel!
    var label2:UILabel!
    var label3:UILabel!
    var label4:UILabel!
    var label5:UILabel!
    
    func configData(tumples:(String,String,String,String,String)) {
        label1.text = tumples.0;
        label2.text = tumples.1;
        label3.text = tumples.2;
        label4.text = tumples.3;
        label5.text = tumples.4;
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.selectionStyle = .none
        label1 = UILabel.init(frame:CGRect.init(x: kscreenW/5*0, y: 0, width: kscreenW/5, height: 40));
        label1.font = UIFont.systemFont(ofSize: 15)
        label1.textAlignment = .center
        label1.textColor = UIColor.colorWith(hex: "656565")
        self.contentView.addSubview(label1)
        
        label2 = UILabel.init(frame:CGRect.init(x: kscreenW/5*1, y: 0, width: kscreenW/5, height: 40));
        label2.font = UIFont.systemFont(ofSize: 15)
        label2.textAlignment = .center
        label2.textColor = UIColor.colorWith(hex: "656565")
        self.contentView.addSubview(label2)
        
        label3 = UILabel.init(frame:CGRect.init(x: kscreenW/5*2, y: 0, width: kscreenW/5, height: 40));
        label3.font = UIFont.systemFont(ofSize: 15)
        label3.textAlignment = .center
        label3.textColor = UIColor.colorWith(hex: "656565")
        self.contentView.addSubview(label3)
        
        label4 = UILabel.init(frame:CGRect.init(x: kscreenW/5*3, y: 0, width: kscreenW/5, height: 40));
        label4.font = UIFont.systemFont(ofSize: 15)
        label4.textAlignment = .center
        label4.textColor = UIColor.colorWith(hex: "656565")
        self.contentView.addSubview(label4)
        
        label5 = UILabel.init(frame:CGRect.init(x: kscreenW/5*4, y: 0, width: kscreenW/5, height: 40));
        label5.font = UIFont.systemFont(ofSize: 15)
        label5.textAlignment = .center
        label5.textColor = UIColor.colorWith(hex: "656565")
        self.contentView.addSubview(label5)
        
        let dataArr = ["脸黑","当天投入","累计投入","中奖","利润"];
        for (index,_) in dataArr.enumerated() {
            let x:CGFloat = CGFloat(index)*kscreenW/5
     
            let downline = UILabel.init(frame: CGRect.init(x: x, y:0 , width: 0.8, height: 40))
            downline.backgroundColor = kLineColor
            self.contentView.addSubview(downline)
        }
        
        let downline1 = UILabel.init(frame: CGRect.init(x: 0, y:39.2 , width: kscreenW, height: 0.8))
        downline1.backgroundColor = kLineColor
        self.contentView.addSubview(downline1)
        
    }
}
