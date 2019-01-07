//
//  RZZBaseViewController.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/7.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZBaseViewController: UIViewController {

    // MARK: - 定义属性
    var contentView : UIView?

    // MARK: - 懒加载属性
    lazy var animImageView : UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "img_loading_1")!, UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return imageView
    }()

    // MARK: - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configBack() {
        let item = UIBarButtonItem.init(image: nil, style: .done, target: self, action: #selector(backClick))
        self.navigationItem.leftBarButtonItem = item
    }
    
    func configNaviTitle(title: String) {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.text = title
        label.font = UIFont.systemFont(ofSize: 16.0)
        self.navigationItem.titleView = label
    }
    
    @objc func backClick() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension RZZBaseViewController {
    @objc func setupUI() {
        //隐藏内容的View
        contentView?.isHidden = true
        
        view.addSubview(animImageView)
        
        //执行动画
        animImageView.startAnimating()
        
        view.backgroundColor = UIColor.white
    }
    
    func loadDataFinished() {
        //停止动画
        animImageView.stopAnimating()
        //隐藏
        animImageView.isHidden = true
        //显示内容
        contentView?.isHidden = false
    }
}

