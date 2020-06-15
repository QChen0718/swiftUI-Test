//
//  NetworkAPI.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/13.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Foundation

#if DEBUG
//--------测试https
let HTTP_REQUEST_URL                            = "https://test-api4app.1caifu.com/api/"
//--------新的域名
let NEW_HTTP_REQUEST_URL                            = "https://testsaas-api.xiaohu.in/api/app/"
#else
//********************正式环境 https***********************************
let HTTP_REQUEST_URL                            = "https://saas-api.1caifu.com/api/"
//--------新的域名
let NEW_HTTP_REQUEST_URL                            = "https://saas-sysapi.1caifu.com/api/app/"
#endif

let REQUEST_GET_CUSTOMERLIST =  NEW_HTTP_REQUEST_URL + "user/customer"
