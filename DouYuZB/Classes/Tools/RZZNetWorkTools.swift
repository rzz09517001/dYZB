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
    class func requestDta(urlString: String, method: MethodType, parameters: [String : Any]? = nil, finishedCallback: @escaping (_ result : AnyObject) -> ()) {
        let requestMethod = (method == .GET ? HTTPMethod.get : HTTPMethod.post)
        Alamofire.request(urlString, method: requestMethod, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error as Any)
                return
            }
            finishedCallback(result as AnyObject)
        }
    }

}
