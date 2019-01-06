//
//  RZZGameViewModel.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/6.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZGameViewModel {
    
    lazy var gameModels : [RZZGameModel]? = [RZZGameModel]()

}

extension RZZGameViewModel {
    func loadAllGameData(finishedCallBack: @escaping () -> ()) {
        RZZNetWorkTools.requestDta(urlString: "https://apiv2.douyucdn.cn/live/cate/getLiveCate1List", method: .GET, parameters: ["client_sys" : "ios"]) { (result) in
            let data : [String : Any] = ["error" : 0, "data" : [
                ["tag_name" : "英雄联盟", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/d3e0073bfb714186ab0c818744601963.jpg"],
                ["tag_name" : "堡垒之夜", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/10253417ea81474dee99121655f5f8be.jpg"],
                ["tag_name" : "DOTA2", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/a887fa9dc9d6901b5fd5c86c8e169436.jpg"],
                ["tag_name" : "炉石传说", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/26d993d79c1daa53d1b083980e97559e.jpg"],
                ["tag_name" : "穿越火线", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/94691f7a259e7e85c4c65e5849cd94dc.jpg"],
                ["tag_name" : "英雄联盟", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/d3e0073bfb714186ab0c818744601963.jpg"],
                ["tag_name" : "堡垒之夜", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/10253417ea81474dee99121655f5f8be.jpg"],
                ["tag_name" : "DOTA2", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/a887fa9dc9d6901b5fd5c86c8e169436.jpg"],
                ["tag_name" : "炉石传说", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/26d993d79c1daa53d1b083980e97559e.jpg"],
                ["tag_name" : "穿越火线", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/94691f7a259e7e85c4c65e5849cd94dc.jpg"],
                ["tag_name" : "英雄联盟", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/d3e0073bfb714186ab0c818744601963.jpg"],
                ["tag_name" : "堡垒之夜", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/10253417ea81474dee99121655f5f8be.jpg"],
                ["tag_name" : "DOTA2", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/a887fa9dc9d6901b5fd5c86c8e169436.jpg"],
                ["tag_name" : "炉石传说", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/26d993d79c1daa53d1b083980e97559e.jpg"],
                ["tag_name" : "穿越火线", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/94691f7a259e7e85c4c65e5849cd94dc.jpg"],
                ["tag_name" : "英雄联盟", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/d3e0073bfb714186ab0c818744601963.jpg"],
                ["tag_name" : "堡垒之夜", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/10253417ea81474dee99121655f5f8be.jpg"],
                ["tag_name" : "DOTA2", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/a887fa9dc9d6901b5fd5c86c8e169436.jpg"],
                ["tag_name" : "炉石传说", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/26d993d79c1daa53d1b083980e97559e.jpg"],
                ["tag_name" : "穿越火线", "icon_url" : "https://cs-op.douyucdn.cn/dycatr/game_cate/94691f7a259e7e85c4c65e5849cd94dc.jpg"]]]
            guard let araryData = data["data"] as? [[String : Any]] else { return }
            for dic in araryData {
                self.gameModels?.append(RZZGameModel(dict: dic))
            }
            finishedCallBack()
        }
    }
}
