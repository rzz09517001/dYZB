//
//  RZZCycleModel.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/6.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZCycleModel: NSObject {
    //标题
    @objc var title : String = ""
    //图片地址
    @objc var pic_url : String = ""
    //主播信息对应的字典
    @objc var room : [String : NSObject]? {
        didSet {
            guard let room = room else { return }
            anchor = RZZAnchorModel(dic: room)
        }
    }
    //主播信息模型
    @objc var anchor : RZZAnchorModel?
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }

}
