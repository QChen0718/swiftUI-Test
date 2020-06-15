//
//  LogManager.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/13.
//  Copyright © 2020 陈庆. All rights reserved.
//
import Alamofire
class MLog {
    required public init<N>(_ message: N) {
        MLog.printLog(message)
    }
    open class func verbose<N>(_ message: N) {
        printLog(message)
    }
    open class func debug<N>(_ message: N) {
        printLog(message)
    }
    open class func info<N>(_ message: N) {
        printLog(message)
    }
    open class func warning<N>(_ message: N) {
        printLog(message)
    }
    open class func error<N>(_ message: N) {
        printLog(message)
    }
    open class func severe<N>(_ message: N) {
        printLog(message)
    }
    open class func logln<N>(_ message: N) {
        printLog(message)
    }
    fileprivate class func printLog<N>(_ message:N,fileName:String = #file, methodName:String = #function, lineNumber: Int = #line) {
        #if DEBUG
            let path = NSURL(fileURLWithPath: fileName)
        print("[\(String(describing: path.lastPathComponent)):\(lineNumber)] \(methodName) > \(message)");
        #endif
    }
}
public class LogManager: NSObject {
    public static let sharedInstance = LogManager()
    
    public class func showHTTPSeccussInfo(_ URLString:URLConvertible,headers:[String:String]?,param:[String:Any]?,responseJson:[String:Any]?) {
        let headersLog = JSONHelper.prettyJSON(headers) ?? ""
        let paramLog = JSONHelper.prettyJSON(param) ?? ""
        let responseJsonLog = JSONHelper.prettyJSON(responseJson) ?? ""
        let startStr = "\n===================>请求成功开始<===================\n"
        let startEnd = "\n===================>请求成功结束<===================\n"
        MLog.info("\(startStr) 路径:\(URLString)\n 请求头:\(headersLog)\n 参数:\(paramLog)\n 返回:\(responseJsonLog) \(startEnd)")
    }
    
    public class func showHTTPFailInfo(_ URLString: URLConvertible, headers: [String: String]?, param: [String: Any]?, error: Error?){
        
        let headersLog = JSONHelper.prettyJSON(headers) ?? ""
        let paramLog = JSONHelper.prettyJSON(param) ?? ""
        
        let startStr = "\n===================>请求失败开始<===================\n"
        let startEnd = "\n===================>请求失败结束<===================\n"
        MLog.info("\(startStr) 路径:\(URLString)\n 请求头:\(headersLog)\n 参数:\(paramLog)\n 返回:\(String(describing: error))\(startEnd)")
    }
}

