//
//  NSDate-extension.swift
//  DouYuZB
//
//  Created by 任志忠 on 2019/1/5.
//  Copyright © 2019 rzz. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentTime() -> String {
        let nowDate = NSDate()
        let interval = Int(nowDate.timeIntervalSince1970)
        return "\(interval)"
    }
}
