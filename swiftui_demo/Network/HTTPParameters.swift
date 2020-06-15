//
//  HTTPParameters.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/14.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Foundation

public let APP_KEY                                     = "ycfiosiplqs93zpd98qjhayrm"
// 接口密文
public let APP_CIPHERTEX                               = "dhzurowp8adlrmacrkhai8zjrksbdaycfios"

class HttpParameters: NSObject {
    static fileprivate let ApiVersionKey = "Accept-Version"
    public class func getAPISignDictionary(_ headers:[String:String]? = nil)->[String:Any]{
//        api版本
        let apiVersion = HttpParameters.getFirstHeader()[ApiVersionKey] ?? ""
        let date:Date = Date()
        let dateformatter:DateFormatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let timeStr = dateformatter.string(from: date)
        let signStr = APP_CIPHERTEX + "apiVersion" + apiVersion + "appKey" + APP_KEY + "timeStamp" + timeStr
        let mdSignStr = signStr.md5.uppercased()
        
//        版本号
        let APP_VERSION:String? = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        return ["version": APP_VERSION ?? "","apiVersion": apiVersion, "appKey": APP_KEY, "timeStamp": timeStr, "sign": mdSignStr,"appToken":"xPNDoG47U/W/HExBvZ7VU45U/X5tPII6EqnPak9VuQnHz+47b/6aMA=="]
    }
    open class func getFirstHeader()-> [String: String] {
        return [ApiVersionKey: "1.0.0"]
    }
    
    
}
