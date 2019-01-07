//
//  RZZAmuseMenuView.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/7.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kMenuCellID = "kMenuCellID"

class RZZAmuseMenuView: UIView {
    // MARK: - 定义属性
    var groups : [RZZAchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    // MARK: - 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = .init(rawValue: 0)
        collectionView.register(UINib(nibName: "RZZAmuseMenuCell", bundle: nil), forCellWithReuseIdentifier: kMenuCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //这里设置cell的尺寸，上面方法拿到的尺寸不对
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }


}

extension RZZAmuseMenuView {
    class func amuseMenuView() -> RZZAmuseMenuView {
        return Bundle.main.loadNibNamed("RZZAmuseMenuView", owner: nil, options: nil)?.first as! RZZAmuseMenuView
    }
}

extension RZZAmuseMenuView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if groups == nil { return 0 }
        let pageNum = (groups!.count - 1) / 8 + 1
        pageControl.numberOfPages = pageNum
        return pageNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMenuCellID, for: indexPath) as! RZZAmuseMenuCell
        setupCellDataWithCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    private func setupCellDataWithCell(cell: RZZAmuseMenuCell, indexPath : IndexPath) {
        //1.0页，取到7
        //1.1页，取到15
        //1.2页，取到23
        //1.取出起始位置
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        //判断越界问题
        if endIndex > groups!.count - 1 {
            endIndex = groups!.count - 1
        }
        cell.groups = Array(groups![startIndex...endIndex])
    }
}

extension RZZAmuseMenuView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
}

