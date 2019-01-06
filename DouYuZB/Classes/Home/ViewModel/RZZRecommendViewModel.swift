//
//  RZZRecommendViewModel.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/5.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZRecommendViewModel {
    lazy var anchorGroups : [RZZAchorGroup] = [RZZAchorGroup]()
    private lazy var firstGroup : RZZAchorGroup = RZZAchorGroup()
    private lazy var secondGroup : RZZAchorGroup = RZZAchorGroup()
    lazy var cycleModels : [RZZCycleModel] = [RZZCycleModel]()

}

extension RZZRecommendViewModel {
    //请求推荐数据
    func requestData(finishCallBack:@escaping () -> ()) {
        let dGroup = DispatchGroup()
        //1.请求推荐数据
        let firstData : [String : Any] = ["error" : 0, "data" :[
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311]
            ]
        ]
        dGroup.enter()
        RZZNetWorkTools.requestDta(urlString: "https://apiv2.douyucdn.cn/mgapi/livenc/home/getRecCardList", method: .GET, parameters: ["client_sys" : "ios", "limit" : "10", "offset" : "0"]) { (result) in
            guard let dataArray = firstData["data"] as? [[String : NSObject]] else { return }
            self.firstGroup.icon_name = "home_header_hot"
            self.firstGroup.tag_name = "热门"
            for dic in dataArray {
                let anchor = RZZAnchorModel.init(dic: dic)
                self.firstGroup.anchors.append(anchor)
            }
            dGroup.leave()
        }
        //2.请求颜值数据
        let secondData : [String : Any] = ["error" : 0, "data" :[
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311],
            ["room_id" : 19002,
             "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
             "is_vertical" : 0,
             "room_name" : "DOTA2好汉杯淘汰赛",
             "nickname" : "imbadota2频道",
             "online" : 232311]
            ]
        ]
        dGroup.enter()
        RZZNetWorkTools.requestDta(urlString: "https://apiv2.douyucdn.cn/mgapi/livenc/home/getRecCardList", method: .GET, parameters: ["client_sys" : "ios", "limit" : "10", "offset" : "0"]) { (result) in
            guard let dataArray = secondData["data"] as? [[String : NSObject]] else { return }
            self.secondGroup.icon_name = "home_header_normal"
            self.secondGroup.tag_name = "颜值"
            for dic in dataArray {
                let anchor = RZZAnchorModel.init(dic: dic)
                self.secondGroup.anchors.append(anchor)
            }
            dGroup.leave()
        }
        //3.请求后面部分的数据
        let resultData : [String : Any] = ["error" : 0,"data" : [
            ["tag_name" : "魔兽世界", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ],
            ["tag_name" : "王者荣耀", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ],
            ["tag_name" : "穿越火线", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ],
            ["tag_name" : "地下城", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ],
            ["tag_name" : "QQ飞车", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ],
            ["tag_name" : "绝地求生", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ],
            ["tag_name" : "斗地主", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ],
            ["tag_name" : "足球世界", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ],
            ["tag_name" : "大话西游", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/f779aaa7554c44c8f0e43e2845a8683e.png", "room_list" : [
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311],
                ["room_id" : 19002,
                 "vertical_src" : "https://rpic.douyucdn.cn/asrpic/190105/19002_1731.jpg/dy1",
                 "is_vertical" : 0,
                 "room_name" : "DOTA2好汉杯淘汰赛",
                 "nickname" : "imbadota2频道",
                 "online" : 232311]]
            ]
            ]]
        dGroup.enter()
        RZZNetWorkTools.requestDta(urlString: "https://apiv2.douyucdn.cn/mgapi/livenc/home/getRecCardList", method: .GET, parameters: ["client_sys" : "ios", "limit" : "10", "offset" : "0"]) { (result) in
            guard let dataArray = resultData["data"] as? [[String : NSObject]] else { return }
            
            for dic in dataArray {
                let group = RZZAchorGroup.init(dict: dic)
                self.anchorGroups.append(group)
            }
            dGroup.leave()
        }
        dGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.secondGroup, at: 0)
            self.anchorGroups.insert(self.firstGroup, at: 0)
            finishCallBack()
        }
    }
    
    //请求无限轮播数据
    func requestCycleData(finishCallBack: @escaping () -> ()) {
        RZZNetWorkTools.requestDta(urlString: "https://apiv3.douyucdn.cn/mgapi/live/mhome/getSlidesRec?client_sys=ios", method: .GET) { (result) in
            guard let resultDict = result as? [String : NSObject] else { return }
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            for dict in dataArray {
                self.cycleModels.append(RZZCycleModel(dict: dict))
            }
            finishCallBack()
        }
    }
}

