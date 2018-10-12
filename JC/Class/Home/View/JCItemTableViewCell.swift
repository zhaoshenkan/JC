//
//  JCItemTableViewCell.swift
//  JC
//
//  Created by 赵申侃 on 2018/9/12.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit

class JCItemTableViewCell: UITableViewCell {
    
    var titleLbl:UILabel!
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        let view = UIView.init(frame: CGRect.init(x: 10, y: 10, width: kscreenW - 20, height: 80));
        view.backgroundColor = kThemeColor;
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = true;
        self.contentView.addSubview(view);
        
        titleLbl = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: view.viewWidth - 40, height: view.viewHeight))
        titleLbl.font = UIFont.boldSystemFont(ofSize: 25)
        titleLbl.textColor = .white;
        view.addSubview(titleLbl);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
