//
//  RZZCollectionPrettyCell.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/4.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit
import Kingfisher

class RZZCollectionPrettyCell: UICollectionViewCell {

    //MARK: - 控件
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var cityBtn: UIButton!
    
    //MARK: - 定义模型
    var anchor : RZZAnchorModel? {
        didSet {
            guard let anchor = anchor else { return }
            var onlineStr :String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            //昵称
            nickNameLabel.text = anchor.nickname
            //所在城市
            cityBtn.setTitle(anchor.anchor_city, for: .normal)
            //图片
            let imgURL = URL(string: anchor.vertical_src)
            iconImageView.kf.setImage(with: imgURL)            
        }
    }

}
