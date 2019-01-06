//
//  RZZRecommendCycleView.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/5.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RZZRecommendCycleView: UIView {
   
    //MARK: - Model
    var cycleModels : [RZZCycleModel]? {
        didSet {
            collectionView.reloadData()
            pageControl.numberOfPages = cycleModels?.count ?? 0
        }
    }
    
    //MARK: - 控件
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置控件不随着父控件的拉伸而拉伸
        autoresizingMask = .init(rawValue: 0)
        //注册cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCycleCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
}

extension RZZRecommendCycleView {
    class func recommendCycleView() -> RZZRecommendCycleView {
        return Bundle.main.loadNibNamed("RZZRecommendCycleView", owner: nil, options: nil)?.first as! RZZRecommendCycleView
    }
}

//MARK: - 数据源协议
extension RZZRecommendCycleView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cycleModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cycleModel = cycleModels![indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
}
