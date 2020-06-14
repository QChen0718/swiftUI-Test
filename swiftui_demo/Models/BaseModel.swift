//
//  BaseModel.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/14.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Foundation
import HandyJSON


class BaseModel:NSObject,HandyJSON {
    required override init() {
        
    }
    var isSuccess:Bool = false
    var totalCount:Int = 0
    var errMsg:String = ""
    
}
