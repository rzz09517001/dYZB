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
private let kNormalItemH = kItemW * 3 / 4
private let kPrettyItemH = kItemW * 4 / 3
private let kHeaderViewH : CGFloat = 50
private let kCycleViewH = kScreenW * 3/8
private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
private let kPrettyCellID = "kPrettyCellID"

class RZZRecommendViewController: UIViewController {

    //MARK: - 懒加载属性
    private lazy var recommendVM : RZZRecommendViewModel = RZZRecommendViewModel()
    private lazy var collectionView : UICollectionView =  { [unowned self] in
        //创建布局
        let layout = UICollectionViewFlowLayout()
        //设置item大小
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
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
    private lazy var cycleView : RZZRecommendCycleView = {
        let cycleView = RZZRecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -kCycleViewH, width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    
    //MARK: - 系统回调方法
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI
        setupUI()
        //请求数据
        loadData()
    }

}

//MARK: - 设置UI
extension RZZRecommendViewController {
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.addSubview(cycleView)
        //设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH, left: 0, bottom: 0, right: 0)
    }
}

//MARK: - 请求数据
extension RZZRecommendViewController {
    private func loadData() {
        //请求数据
        recommendVM.requestData {
            self.collectionView.reloadData()
        }
        //轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}

//MARK: - 遵守UICollectionView 的dataSources
extension RZZRecommendViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.recommendVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = self.recommendVM.anchorGroups[section]
        return group.anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let group = recommendVM.anchorGroups[indexPath.section]
        let anchorModel = group.anchors[indexPath.row]
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! RZZCollectionPrettyCell
            cell.anchor = anchorModel
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! RZZCollectionNormalCell
            cell.anchor = anchorModel
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView : RZZCollectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! RZZCollectionHeaderView
        headerView.model = recommendVM.anchorGroups[indexPath.section]
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPrettyItemH)
        }
        return CGSize(width: kItemW, height: kNormalItemH)
    }
    
}
