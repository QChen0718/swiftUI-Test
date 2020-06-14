//
//  RequestLoggerPlugin.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/13.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Moya
import enum Result.Result

public class RequestLoggerPlugin: PluginType {
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        if case .success(let response) = result {
            var dict:[String:Any] = [:]
            if let data = response.request?.httpBody {
//                data转换成字典
                let obj = try? JSONSerialization.jsonObject(
                    with: data,
                    options: .allowFragments)
                dict = (obj as? [String:Any]) ?? [:]
            }
//           接口返回内容
            let json = (try? response.mapJSON()) as? [String: Any]
//            请求URL
            let url = response.request?.url?.absoluteString ?? ""
//            请求头
            let headers = response.request?.allHTTPHeaderFields ?? [:]
            
            LogManager.showHTTPSeccussInfo(url, headers: headers, param: dict, responseJson: json)
            
            let isSuccess = json?["isSuccess"] as? Bool
            if isSuccess == false{
                
                MLog.debug("服务端返回失败" + url)
            }
            
        }else if case .failure(let error) = result {
            guard let data = error.response?.request?.httpBody
                else { return }
            
            let obj = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments)
            let dict = (obj as? [String: Any]) ?? [:]
            
            let url = error.response?.request?.url?.absoluteString ?? ""
            let headers = error.response?.request?.allHTTPHeaderFields ?? [:]
            
            LogManager.showHTTPFailInfo(
                url,
                headers: headers,
                param: dict,
                error: error)
        }
    }
}
