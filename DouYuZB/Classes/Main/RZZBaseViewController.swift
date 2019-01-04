//
//  RZZBaseViewController.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/1.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
