//
//  RZZAchorGroup.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/5.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZAchorGroup: RZZBaseModel {
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
    //组显示的图标
    @objc var icon_name : String = "home_header_phone"
    
    lazy var anchors : [RZZAnchorModel] = [RZZAnchorModel]()
}
