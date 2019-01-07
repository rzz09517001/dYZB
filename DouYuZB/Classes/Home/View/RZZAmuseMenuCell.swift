//
//  RZZAmuseMenuCell.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/7.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kGemeCellID = "kGemeCellID"

class RZZAmuseMenuCell: UICollectionViewCell {

    // MARK: - 数组模型
    var groups : [RZZAchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: "RZZGameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kGemeCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemW = collectionView.bounds.width / 4
        let itemH = collectionView.bounds.height / 2
        layout.itemSize = CGSize(width: itemW, height: itemH)
    }

}

extension RZZAmuseMenuCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGemeCellID, for: indexPath) as! RZZGameCollectionViewCell
        cell.model = groups![indexPath.item]
        cell.clipsToBounds = true
        return cell
    }
}
