//
//  RZZBaseModel.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/6.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZBaseModel: NSObject {
    @objc var tag_name : String = ""
    @objc var icon_url : String = ""
    
    override init() {
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }

}
