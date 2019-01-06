//
//  RZZAchorGroup.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/5.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZAchorGroup: NSObject {
    //该组中对应的房间信息
    @objc var room_list : [[String : NSObject]]? {
        didSet {
            guard let room_list = room_list else {
                return
            }
            for dic in room_list {
                anchors.append(RZZAnchorModel.init(dic: dic))
            }
        }
    }
    //组显示的标题
    @objc var tag_name : String = ""
    //组显示的图标
    @objc var icon_name : String = "home_header_phone"
    //游戏对应图标
    @objc var icon_url : String = ""
    
    lazy var anchors : [RZZAnchorModel] = [RZZAnchorModel]()
    
    override init() {
    }
    
    init(dic : [String : Any]) {
        super.init()
        //字典转模型
        setValuesForKeys(dic)
    }
    
    //避免对应字段没有值导致奔溃，重写本方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    

}
