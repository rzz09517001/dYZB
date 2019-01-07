//
//  RZZFunnyViewModel.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/7.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit

class RZZFunnyViewModel: RZZBaseViewModel {

}

extension RZZFunnyViewModel {
    func loadFunnyData(finishCallBack: @escaping () -> ()) {
        loadAnchorData(URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", parameters: nil, finishCallBack: finishCallBack)
    }
}
