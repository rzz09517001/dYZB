//
//  RZZHomeViewController.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/1.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40.0
private let kTabbarH : CGFloat = 44

class RZZHomeViewController: RZZBaseViewController {
    //懒加载
    private lazy var pageTitleView : RZZPageTitleView = { [weak self] in
        let titleFram = CGRect(x: 0, y: kStatusBarH + kNaviBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = RZZPageTitleView(frame: titleFram, titles: titles)
        titleView.backgroundColor = UIColor.white
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var pageContentView : RZZPageContentView = {[weak self] in
        let kContentH = kScreenH - kStatusBarH - kNaviBarH - kTitleViewH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNaviBarH + kTitleViewH, width: kScreenW, height: kContentH)
        
        var childVcs = [UIViewController]()
        childVcs.append(RZZRecommendViewController())
        childVcs.append(RZZGameViewController())
        childVcs.append(RZZAmuseViewController())
        childVcs.append(RZZFunnyViewController())
        let pageContentView = RZZPageContentView(frame: contentFrame, childVcs: childVcs, parentVc: self)
        pageContentView.delegate = self
        return pageContentView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

// MARK: 设置UI
extension RZZHomeViewController {
    fileprivate func setupUI() {
        //不需要系统自动调整scrollView的内边距
        setupNaviBar()
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
    }
    
    private func setupNaviBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        self.navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}

extension RZZHomeViewController: RZZPageTitleViewDelegate {
    func pageTitleView(titleView: RZZPageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

extension RZZHomeViewController: RZZPageContentViewDelegate {
    func pageContentView(contentView: RZZPageContentView, prograss: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithPrograss(prograss: prograss, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
