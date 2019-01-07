//
//  RZZNavigationViewController.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/1.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取系统添加的返回手势
        guard let systemGes = interactivePopGestureRecognizer else { return }
        //获取手势添加到的view
        guard let gesView = systemGes.view else {
            return
        }
        //获取target/action
        //利用runtime查看所有属性名称
        /*
        var count : UInt32 = 0
        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
        for i in 0..<count {
            let ivar = ivars[Int(i)]
            let name = ivar_getName(ivar)
            print(String(cString: name!))
        }
         */
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else {
            return
        }
        //取出target
        guard let target = targetObjc.value(forKey: "target") else {
            return
        }
        //取出Action
//        guard let action = targetObjc.value(forKey: "action") else {
//            return
//        }
        let action = Selector("handleNavigationTransition:")
        //创建自己的手势
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
    }
}

