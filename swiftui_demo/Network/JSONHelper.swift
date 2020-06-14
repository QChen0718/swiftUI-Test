//
//  JSONHelper.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/13.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Foundation

class JSONHelper {
    class func prettyJSON(_ object: Any?) -> String? {

        if object == nil {
            return nil
        }

        do {
            let data: Data = try JSONSerialization.data(withJSONObject: object!, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String.init(data: data, encoding: String.Encoding.utf8)
        }
        catch _ as NSError {
            return nil
        }
    }
    //json 转字典
    open class func jsonAnalysis(_ str : String) -> [String : Any]?{
        
        guard let data = str.data(using: String.Encoding.utf8),
            let dict = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {
                
                return nil
        }
        
        return dict
    }
}
