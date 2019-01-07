//
//  RZZFunnyViewController.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/7.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kTopMargin : CGFloat = 10

class RZZFunnyViewController: RZZBaseAnchorViewController {
    
    // MARK: - 懒加载属性
    fileprivate lazy var funnyVM : RZZFunnyViewModel = RZZFunnyViewModel()

    
}

extension RZZFunnyViewController {
    override func setupUI() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0)
    }
}

extension RZZFunnyViewController {
    override func loadData() {
        baseVM = funnyVM
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
