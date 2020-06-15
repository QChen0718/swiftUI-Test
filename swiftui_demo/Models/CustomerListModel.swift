//
//  CustomerListModel.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/14.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Foundation

class CustomerListModel: BaseModel{
    var data:[CustomerListDataModel]?
    
}
class CustomerListDataModel:BaseModel, Identifiable{
    var lastLoginTime:String = "无"
    var tagList:[String] = []
    var id :Int = 0
    var totalPrice:String = ""
    var type:Int = 0
    var photo:String = ""
    var name:String = ""
}
