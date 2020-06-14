//
//  LandmarkList.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/7.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    var body: some View {
            List {
//                isOn 点击事件对 userData.showFavoritesOnly 取反
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                ForEach(userData.landmarks){ landmark in
//                    
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark).environmentObject(self.userData)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
        .navigationBarTitle(Text("列表"))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData())
    }
}
