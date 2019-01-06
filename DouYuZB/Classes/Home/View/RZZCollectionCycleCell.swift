//
//  RZZCollectionCycleCell.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/6.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZCollectionCycleCell: UICollectionViewCell {
    
    //MARK: - 定义模型属性
    var cycleModel : RZZCycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let url = URL(string: cycleModel?.pic_url ?? "")!
            iconImageView.kf.setImage(with: url, placeholder: UIImage(named: "Img_default"))
        }
    }

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
}
