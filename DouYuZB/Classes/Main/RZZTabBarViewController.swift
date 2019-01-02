//
//  RZZTabBarViewController.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/1.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.orange
    }
    
    func insertController(vc : UIViewController, withTitle title : String, andSelectedImage selectedImageName : String, andDesectedImage desectedImageName : String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)
        vc.tabBarItem.image = UIImage.init(named: desectedImageName)
        self.addChild(vc)
    }
    
}
