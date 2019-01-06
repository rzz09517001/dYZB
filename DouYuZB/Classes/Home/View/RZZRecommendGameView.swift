//
//  RZZRecommendGameView.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/6.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"
private let kEdgeInsetMargin : CGFloat = 10

class RZZRecommendGameView: UIView {

    //MARK: - 传递属性
    var groups : [RZZAchorGroup]? {
        didSet {
            //移除前2组数据
            groups?.removeFirst()
            groups?.removeFirst()
            //最后添加个更多组
            let moreGroup = RZZAchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            collecionView.reloadData()
        }
    }
    //MARK: -控件属性
    @IBOutlet weak var collecionView: UICollectionView!
    
    //MARK: - 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        //让控件不随着父控件的拉伸而拉伸
        autoresizingMask = .init(rawValue: 0)
        //注册cell
        collecionView.register(UINib(nibName: "RZZGameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        //添加内边距
        collecionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }
    

}

//MARK: - 提供快速创建的类方法
extension RZZRecommendGameView {
    class func recommendGameView() -> RZZRecommendGameView {
        return Bundle.main.loadNibNamed("RZZRecommendGameView", owner: nil, options: nil)?.first as! RZZRecommendGameView
    }
}

//MARK: - 遵守数据源
extension RZZRecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collecionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! RZZGameCollectionViewCell
        cell.model = groups![indexPath.item]
        return cell
    }
}
