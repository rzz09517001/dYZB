//
//  RZZCollectionHeaderView.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/4.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZCollectionHeaderView: UICollectionReusableView {
    //MARK: - 控件属性
    
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    var model : RZZAchorGroup? {
        didSet {
            titleLabel.text = model?.tag_name
            iconImageView.image = UIImage(named: model?.icon_name ?? "home_header_phone")
        }
    }
}

// MARK: - 从xib快速创建的类方法
extension RZZCollectionHeaderView {
    class func collectionHeaderView() -> RZZCollectionHeaderView {
        return Bundle.main.loadNibNamed("RZZCollectionHeaderView", owner: nil, options: nil)?.first as! RZZCollectionHeaderView
    }
}


