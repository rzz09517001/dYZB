//
//  RZZAmuseViewController.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/7.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kMenuViewH : CGFloat = 200

class RZZAmuseViewController: RZZBaseAnchorViewController {
    // MARK: - 懒加载属性
    fileprivate lazy var amuseVM : RZZAmuseViewModel = RZZAmuseViewModel()
    fileprivate lazy var amuseMenuView : RZZAmuseMenuView = {
        let amuseMenuView = RZZAmuseMenuView.amuseMenuView()
        amuseMenuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        return amuseMenuView
    }()
}

// MARK: - 设置UI
extension RZZAmuseViewController {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(amuseMenuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
    }
}


// MARK: - 请求数据
extension RZZAmuseViewController {
    override func loadData() {
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
            self.amuseMenuView.groups = self.amuseVM.anchorGroups
        }
    }
}


