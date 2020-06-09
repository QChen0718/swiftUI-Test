//
//  UserData.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/7.
//  Copyright © 2020 陈庆. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
//    ObservableObject 对象 里面的变量发生改变时会实时的更新UI界面
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
