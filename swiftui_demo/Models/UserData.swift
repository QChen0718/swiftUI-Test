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
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
