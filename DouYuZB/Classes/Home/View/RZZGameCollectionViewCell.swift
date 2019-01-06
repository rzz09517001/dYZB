//
//  RZZGameCollectionViewCell.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/6.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZGameCollectionViewCell: UICollectionViewCell {

    //MARK: - 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Model
    var model : RZZBaseModel? {
        didSet {
            titleLabel.text = model?.tag_name
            let url = URL(string: model?.icon_url ?? "")
            iconImageView.kf.setImage(with: url, placeholder: UIImage(named: "home_more_btn"))
        }
    }
    
    //MARK: - 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
