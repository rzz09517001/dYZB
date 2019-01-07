//
//  RZZBaseViewController.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/1.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

let kItemMargin : CGFloat = 10
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4
let kPrettyItemH = kNormalItemW * 4 / 3
let kHeaderViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
let kPrettyCellID = "kPrettyCellID"

class RZZBaseAnchorViewController: UIViewController {

    // MARK: -懒加载属性
    var baseVM : RZZBaseViewModel!
    lazy var collectionView : UICollectionView =  { [unowned self] in
        //创建布局
        let layout = UICollectionViewFlowLayout()
        //设置item大小
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        //设置行间距
        layout.minimumLineSpacing = 0
        //设置Item之间的间距
        layout.minimumInteritemSpacing = kItemMargin
        //设置滚动方向
        layout.scrollDirection = .vertical
        //设置头部大小
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        //设置内边距
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        //创建UICollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        //设置collectionView随着父控制器范围而变化
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(UINib(nibName: "RZZCollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "RZZCollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        collectionView.register(UINib(nibName: "RZZCollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        return collectionView
        }()
    // MARK: -系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}

// MARK: - 设置UI
extension RZZBaseAnchorViewController {
     @objc func setupUI() {
        view.addSubview(collectionView)
    }
}

// MARK: - 加载数据
extension RZZBaseAnchorViewController {
    @objc func loadData() {
        //子类重写此方法
    }
}


// MARK: - 数据协议
extension RZZBaseAnchorViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! RZZCollectionNormalCell
        cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! RZZCollectionHeaderView
        headerView.model = baseVM.anchorGroups[indexPath.section]
        return headerView
    }
}
