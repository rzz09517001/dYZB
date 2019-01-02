//
//  RZZRecommendViewController.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/2.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kItemW = (kScreenW - 3 * kItemMargin) / 2
private let kItemH = kItemW * 3 / 4
private let kHeaderViewH : CGFloat = 50
private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"

class RZZRecommendViewController: UIViewController {

    //MARK: - 懒加载属性
    private lazy var collectionView : UICollectionView =  { [unowned self] in
        //创建布局
        let layout = UICollectionViewFlowLayout()
        //设置item大小
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
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
        collectionView.backgroundColor = UIColor.blue
        collectionView.dataSource = self
        //设置collectionView随着父控制器范围而变化
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier:kHeaderViewID)
        
        return collectionView
    }()
    
    //MARK: - 系统回调方法
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        //设置UI
        setupUI()
    }

}

extension RZZRecommendViewController {
    private func setupUI() {
        view.addSubview(collectionView)
    }
}

//MARK: - 遵守UICollectionView 的dataSources
extension RZZRecommendViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        headerView.backgroundColor = UIColor.green
        return headerView
    }
}
