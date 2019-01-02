//
//  AppDelegate.swift
//  DouYuZB
//
//  Created by 任志忠 on 2018/12/31.
//  Copyright © 2018 rzz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.windowInit()
        return true
    }
    
    func windowInit() {
        let tabBarVc = RZZTabBarViewController()
        let homeVc = RZZNavigationViewController.init(rootViewController: RZZHomeViewController())
        tabBarVc.insertController(vc: homeVc, withTitle: "首页", andSelectedImage: "btn_home_selected", andDesectedImage: "btn_home_normal")
        let liveVc = RZZNavigationViewController.init(rootViewController: RZZLiveViewController())
        tabBarVc.insertController(vc: liveVc, withTitle: "直播", andSelectedImage: "btn_column_selected", andDesectedImage: "btn_column_normal")
        let followVc = RZZNavigationViewController.init(rootViewController: RZZFollowViewController())
        tabBarVc.insertController(vc: followVc, withTitle: "关注", andSelectedImage: "btn_live_selected", andDesectedImage: "btn_live_normal")
        let myVc = RZZNavigationViewController.init(rootViewController: RZZMyViewController())
        tabBarVc.insertController(vc: myVc, withTitle: "我的", andSelectedImage: "btn_user_selected", andDesectedImage: "btn_user_normal")
        tabBarVc.selectedIndex = 0
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabBarVc
        self.window?.makeKeyAndVisible()
    }

}

