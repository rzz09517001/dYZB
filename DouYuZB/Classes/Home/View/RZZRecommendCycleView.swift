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
   
    //MARK: - 定时器
    var cycleTimer : Timer?
    //MARK: - Model
    var cycleModels : [RZZCycleModel]? {
        didSet {
            collectionView.reloadData()
            pageControl.numberOfPages = cycleModels?.count ?? 0
            //默认滚动到中间某个位置，以实现可以往前滚动
            let indexPath = NSIndexPath(item: (cycleModels?.count ?? 0) * 20, section: 0)
            collectionView.scrollToItem(at: indexPath as IndexPath, at: .left, animated: false)
            //添加定时器
            removeCycleTimer()
            addCycleTimer()
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
        collectionView.register(UINib(nibName: "RZZCollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
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
        //无限轮播
        return (cycleModels?.count ?? 0) * 10000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! RZZCollectionCycleCell
        cell.cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        return cell
    }
}

//MARK: - 代理协议
extension RZZRecommendCycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //获取滚动偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        //计算pageController的currentIndex
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

//MARK: - 定时器
extension RZZRecommendCycleView {
    private func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: .common)
    }
    
    private func removeCycleTimer() {
        cycleTimer?.invalidate() //从运行循环中移除
        cycleTimer = nil
    }
    
    @objc private func scrollToNext() {
        //获取偏移量
        let currentOffsetX = collectionView.contentOffset.x
        //计算偏移量
        let offsetX = currentOffsetX + collectionView.bounds.width
        //滚动到位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}
