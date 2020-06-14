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
class CustomerListDataModel:BaseModel,ObservableObject{
   @Published var lastLoginTime:String = ""
   @Published var tagList:[String] = []
   @Published var id :Int = 0
   @Published var totalPrice:String = ""
   @Published var type:Int = 0
   @Published var photo:String = ""
   @Published var name:String = ""
}
