//
//  RZZNetWorkTools.swift
//  DouYuZB
//
//  Created by renzhizhong on 2019/1/4.
//  Copyright © 2019 rzz. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class RZZNetWorkTools {
    class func requestData(type: MethodType, urlString: String, parameters: [String : String]? = nil){
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        
    }

}
