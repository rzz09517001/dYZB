//
//  RZZPageTitleView.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/1.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

//MARK - 协议
protocol RZZPageTitleViewDelegate : class {
    func pageTitleView(titleView: RZZPageTitleView, selectedIndex index: Int)
}

//MARK - 常量
private let kBottomLineH : CGFloat = 0.5
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 125, 0)

//MARK - 类
class RZZPageTitleView: UIView {
    //属性
    private var currentIndex : Int = 0
    private var titles : [String]
    weak var delegate : RZZPageTitleViewDelegate?
    //懒加载
    private lazy var titleLabels : [UILabel] = [UILabel]()
    private lazy var scrollView : UIScrollView  = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        return scrollLine
    }()
    //自定义构造函数
    init(frame : CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RZZPageTitleView {
    private func setupUI() {
        addSubview(scrollView)
        scrollView.frame = bounds
        
        setupTitleLabes()
        setupBottomLineAndScrollLine()
    }
    
    private func setupTitleLabes() {
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            label.textAlignment = .center
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            scrollView.addSubview(label)
            titleLabels.append(label)
            //给Label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
        }
    }
    
    private func setupBottomLineAndScrollLine() {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        bottomLine.frame = CGRect(x: 0, y: frame.height - kBottomLineH, width: frame.width, height: kBottomLineH)
        addSubview(bottomLine)
        
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}


// MARK: -监听Label的点击
extension RZZPageTitleView {
    @objc private func titleLabelClick(tapGes: UITapGestureRecognizer) {
        //获取当前Label的下标值
        guard let currentLabel = tapGes.view as? UILabel else { return }
        //获取之前Label
        let oldLabel = titleLabels[currentIndex]
        //切换文字颜色
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        //保存最新的下标值
        currentIndex = currentLabel.tag
        //滚动条位置变动
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) {
            self.scrollLine.frame.origin.x = scrollLineX
        }
        //通知代理做事情
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}

//MARK: -对外暴露方法
extension RZZPageTitleView {
    func setTitleWithPrograss(prograss: CGFloat, sourceIndex: Int, targetIndex: Int) {
        //取出当前Label和目标Label
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        //处理滑块
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * prograss
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        //处理颜色的渐变
        //1取出变化范围
        let colorDetal = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDetal.0 * prograss, g: kSelectColor.1 - colorDetal.1 * prograss, b: kSelectColor.2 - colorDetal.2 * prograss)
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDetal.0 * prograss, g: kNormalColor.1 + colorDetal.1 * prograss, b: kNormalColor.2 + colorDetal.2 * prograss)
        currentIndex = targetIndex
    }
}
