//
//  RZZGameViewController.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/6.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 10

private let kItemW : CGFloat = (kScreenW - 2 * kEdgeMargin) / 3
private let kItemH : CGFloat = kItemW * 6/5
private let kHeaderViewH : CGFloat = 50

private let kGameCellID  = "kGameCellID"
private let kHeaderViewID = "kHeaderViewID"

class RZZGameViewController: UIViewController {

    //MARK: - 懒加载属性
    fileprivate lazy var gameVM : RZZGameViewModel = RZZGameViewModel()
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        //创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "RZZGameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "RZZCollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()
    //MARK: - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()

    }
}

//MARK: - 设置UI
extension RZZGameViewController {
    private func setupUI() {
        view.addSubview(collectionView)
    }
}

//MARK: - 请求数据
extension RZZGameViewController {
    private func loadData() {
        gameVM.loadAllGameData {
            self.collectionView.reloadData()
        }
    }
}

//MARK: - 数据源
extension RZZGameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.gameModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! RZZGameCollectionViewCell
        cell.model = gameVM.gameModels?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! RZZCollectionHeaderView
        header.titleLabel.text = "全部"
        header.iconImageView.image = UIImage(named: "Img_orange")
        header.moreBtn.isHidden = true
        return header
    }
}
