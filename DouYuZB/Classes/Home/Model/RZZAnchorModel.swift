//
//  RZZAnchorModel.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/5.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZAnchorModel: NSObject {
    //房间号
    @objc var room_id : Int = 0
    //房间图片
    @objc var vertical_src : String = ""
    //是手机直播还是电脑直播 0：电脑直播 1：手机直播
    @objc var is_vertical : Int = 0
    //房间名字
    @objc var room_name : String = ""
    //主播昵称
    @objc var nickname : String = ""
    //在线人数
    @objc var online : Int = 0
    //所在城市
    @objc var anchor_city : String = ""

    init(dic : [String : NSObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
