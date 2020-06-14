//
//  BaseService.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/13.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Moya

public enum BaseService {
    case general(
        baseURL: String,
        method: Moya.Method,
        parameters:[String:Any],
        headers:[String:String]
    )
}

extension BaseService: TargetType {
//    根路径
    public var baseURL: URL{
        switch self {
        case let .general(str,_,_,_):
//            中文转码
            return URL(string: str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        }
    }
//    对应请求的子路径
    public var path: String {
        return ""
    }
    
    public var method: Method{
        switch self {
            case let .general(_,method,_,_):
    //            中文转码
                return method
        }
    }
    
    public var sampleData: Data{
        return Data()
    }
    
    public var task: Task{
        switch self {
        case let .general(_, method, parameters,_):
            let param = parameters
            if method == .get || method == .delete {
                return .requestPlain
            }else if method == .put {
                return .requestParameters(parameters: param, encoding: JSONEncoding.prettyPrinted)
            }else if method == .post {
                return .requestParameters(parameters: param, encoding: JSONEncoding.prettyPrinted)
            }
        }
        return .requestPlain
    }
    
    public var headers: [String : String]?{
        switch self {
        case let .general(_,_,_,headers):
            let newheaders = HttpParameters.getAPISignDictionary(headers) as? [String:String]
            return newheaders
        }
    }
}
