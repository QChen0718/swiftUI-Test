//
//  NetworkManager.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/13.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Foundation
import Moya
import HandyJSON
// 超时关闭
let timeoutClosure = {(endpoint:Endpoint,closure:MoyaProvider<BaseService>.RequestResultClosure) -> Void in
    if var urlRequest = try? endpoint.urlRequest() {
//        设置超时时长
        urlRequest.timeoutInterval = 20
//        成功
        closure(.success(urlRequest))
    }else {
//        失败
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
    
}

class NetworkManager {
    fileprivate let provider = MoyaProvider<BaseService>(requestClosure: timeoutClosure, plugins: [RequestLoggerPlugin()])
//    启动网络
    
    open func requestNetWork<T:BaseModel>(
        _ URLString:String,
        method:Moya.Method,
        model:T.Type,
        params:[String:Any]? = nil,
        httpHeaders:[String:String]? = nil,
        paresSuccess:((_ obj:T?)->Void)?=nil,
        parseFail:((_ err:Error?)->Void)?=nil){
//        配置请求链接，请求参数，请求类型，请求头
        let req = BaseService.general(
            baseURL:URLString,
            method:method,
            parameters:params ?? [:],
            headers:httpHeaders ?? [:]
        )
//        请求网络数据
        provider.request(req) {(result) in
            switch result {
                case let .success(response):
                    let model = try? response.mapModel(model)
                    paresSuccess?(model)
                    MLog.debug(response)
                break
            case let .failure(error):
                
                MLog.debug(error)
                break
            }
        }
    }
}
extension Moya.Response{
    func mapModel<T:BaseModel>(_ type:T.Type) throws -> T {
    //        响应返回的二进制数据转换成字符串
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            //抛出解析异常
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}
