//
//  RZZRecommendViewController.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/2.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kCycleViewH = kScreenW * 3/8
private let kGameViewH : CGFloat = 90

class RZZRecommendViewController: RZZBaseAnchorViewController {

    //MARK: - 懒加载属性
    private lazy var recommendVM : RZZRecommendViewModel = RZZRecommendViewModel()
    private lazy var cycleView : RZZRecommendCycleView = {
        let cycleView = RZZRecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    private lazy var gameView : RZZRecommendGameView = {
        let gameView = RZZRecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
}

//MARK: - 设置UI
extension RZZRecommendViewController {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(cycleView)
        collectionView.addSubview(gameView)
        //设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
    }
}

//MARK: - 请求数据
extension RZZRecommendViewController {
    override func loadData() {
        baseVM = recommendVM
        //请求数据
        recommendVM.requestData {
            self.collectionView.reloadData()
            var groups = self.recommendVM.anchorGroups
            //移除前2组数据
            groups.removeFirst()
            groups.removeFirst()
            //最后添加个更多组
            let moreGroup = RZZAchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            self.gameView.groups = groups
            self.loadDataFinished()
        }
        //轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}

//MARK: - 遵守UICollectionView 的dataSources
extension RZZRecommendViewController :UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! RZZCollectionPrettyCell
            cell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            return cell
        } else {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }
        return CGSize(width: kNormalItemW, height: kNormalItemH)
    }
    
}
