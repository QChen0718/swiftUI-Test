//
//  CustomerListVM.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/14.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Foundation
class CustomerListVM:NSObject {
    func startLoad(_ modelArrayBlock:@escaping ([CustomerListDataModel]?)->()) {
    //        请求网络数据
        NetworkManager().requestNetWork(REQUEST_GET_CUSTOMERLIST,method:.get,model: CustomerListModel.self,paresSuccess:{(responseObj:Any?) in
            let model = responseObj as? CustomerListModel
            if let succeck = model?.isSuccess,succeck{
                modelArrayBlock(model?.data)
            }
        }){(_) in
            
        }
    }
}
