//
//  JCMeTableViewCell.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/15.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCMeTableViewCell: UITableViewCell {

    var titleLbl:UILabel!
    var arrowImgView:UIImageView!
    var titleImgView:UIImageView!
    var contentLbl:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initView()
    }
    
    func initView() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = .white;
        
        titleImgView = UIImageView.init()
        titleImgView.contentMode = .scaleAspectFit
        self.contentView.addSubview(titleImgView)
        
        titleLbl = UILabel.init()
        titleLbl.font = UIFont.systemFont(ofSize: 15)
        titleLbl.textColor = UIColor.colorWith(hex: "333333")
        self.contentView.addSubview(titleLbl)
        
        arrowImgView = UIImageView.init()
        arrowImgView.contentMode = .scaleAspectFit
        arrowImgView.image = #imageLiteral(resourceName: "arrow_right");
        self.contentView.addSubview(arrowImgView)
        
        contentLbl = UILabel.init()
        contentLbl.font = UIFont.systemFont(ofSize: 14)
        contentLbl.textColor = UIColor.colorWith(hex: "656565")
        contentLbl.textAlignment = .right
        self.contentView.addSubview(contentLbl)
        
        let downline = UILabel.init(frame: CGRect.init(x: 0, y: 44.2, width: kscreenW, height: 0.8))
        downline.backgroundColor = kLineColor
        self.contentView.addSubview(downline)
        
        titleImgView.frame = CGRect.init(x: 20, y: 12.5, width: 20, height: 20 )
        titleLbl.frame = CGRect.init(x: titleImgView.viewRightX + 10, y: 0, width: 100, height: 45)
        arrowImgView.frame = CGRect.init(x: kscreenW - 20 - 10, y: 12.5, width: 20, height: 20)
        contentLbl.frame = CGRect.init(x: arrowImgView.viewX - 180, y: 0, width: 175, height: 45)
        
    }
    
    func set(style:String) {
        
        if style == "1" {
            contentLbl.isHidden = true
            arrowImgView.isHidden = false
        } else if style == "2" {
            contentLbl.isHidden = false
            arrowImgView.isHidden = true
            arrowImgView.frame = CGRect.init(x: 0, y: 0, width: 0, height: 0);
            contentLbl.frame = CGRect.init(x: kscreenW - 190, y: 0, width: 170, height: 40)
        } else if style == "3" {
            contentLbl.isHidden = false
            arrowImgView.isHidden = false;
        }
 
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class JCMeTableviewHeaderView: UIView {
    
    var avatarImgView:JCAvatarView!
    var userNameLbl:UILabel!
    var phoneLbl:UILabel!
    var stateLbl:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
//        self.initData()
    }
    
    func initData()  {
        
//        userNameLbl.text = JCUserInfo.share.userName;
//        phoneLbl.text = JCUserInfo.share.phone;
//        if JCUserInfo.share.authenticated == true {
//            stateLbl.text = "已认证"
//        } else {
//            stateLbl.text = "未认证"
//        }
//        avatarImgView.set(name: userNameLbl.text!)

    }
    
    func initView()  {
        
        self.backgroundColor = kBcgColor;
        
        avatarImgView = JCAvatarView.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 60))
        self.addSubview(avatarImgView)
        
        userNameLbl = UILabel.init()
        userNameLbl.font = UIFont.systemFont(ofSize: 15)
        userNameLbl.textColor = UIColor.colorWith(hex: "333333")
        self.addSubview(userNameLbl)
        
        phoneLbl = UILabel.init()
        phoneLbl.font = UIFont.systemFont(ofSize: 14)
        phoneLbl.textColor = UIColor.colorWith(hex: "333333")
        self.addSubview(phoneLbl)
        
        stateLbl = UILabel.init()
        stateLbl.font = UIFont.systemFont(ofSize: 14)
        stateLbl.textColor = UIColor.colorWith(hex: "333333")
        self.addSubview(stateLbl)
        
        avatarImgView.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.left.equalTo(20)
            make.top.equalTo(kstatusBarH + 30)
        }
        
        userNameLbl.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImgView.snp.right).offset(20)
            make.height.equalTo(20)
            make.top.equalTo(avatarImgView.snp.top)
        }
        
        phoneLbl.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImgView.snp.right).offset(20)
            make.height.equalTo(20)
            make.top.equalTo(userNameLbl.snp.bottom)
        }
        
        stateLbl.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImgView.snp.right).offset(20)
            make.height.equalTo(20)
            make.top.equalTo(phoneLbl.snp.bottom)
        }
        
        avatarImgView.layer.cornerRadius = 30
        avatarImgView.layer.masksToBounds = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class JCAvatarView: UIView {
    
    var shaperLayer:CAShapeLayer!
    var colorLayer:CAGradientLayer!
    var nameLbl:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        shaperLayer = CAShapeLayer.init()
        shaperLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shaperLayer)
        
        colorLayer = CAGradientLayer.init()
        colorLayer.startPoint = CGPoint.init(x: 0, y: 0 )
        colorLayer.endPoint = CGPoint.init(x: 1, y: 1)
        colorLayer.colors = [UIColor.colorWith(hex: "a3a9b6").cgColor,UIColor.colorWith(hex: "8a8b94").cgColor]
        shaperLayer.addSublayer(colorLayer)
        
        nameLbl = UILabel.init()
        nameLbl.textAlignment = .center
        nameLbl.textColor = .white
        nameLbl.font = UIFont.systemFont(ofSize: 28)
        self.addSubview(nameLbl)
        
        shaperLayer.frame = CGRect.init(x: 0, y: 0, width: self.viewWidth, height: self.viewHeight)
        colorLayer.frame = shaperLayer.frame;
        
        nameLbl.snp.makeConstraints { (make) in
            make.centerY.left.right.equalTo(self)
            make.height.equalTo(self.viewHeight/2)
        }
    }
    
    func set(name:String) {
        guard name.count > 1 else {
            return;
        }
       let str:String = name.mySubString(from: (name.count - 1))
       nameLbl.text = str
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
