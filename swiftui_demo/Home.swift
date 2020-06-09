//
//  Home.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/7.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String:[Landmark]]{
        Dictionary(
        grouping: landmarkData) { (land) -> String in
            land.category.rawValue
        }
    }
    
    var featured : [Landmark] {
        landmarkData.filter{
            $0.isFeatured
        }
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: {
            self.showingProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
            .accessibility(label: Text("User Profile"))
            .padding()
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
//                图片显示模式： .scaledToFill() 图片超出是否裁剪：.clipped()
//                .listRowInsets(EdgeInsets()) 上下左右无边距
                FeaturedLandmarks(landmarks: featured)
                .scaledToFill()
                    .frame(height:200)
                .clipped()
                .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(),id: \.self) {
                    key in
                    
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
            .listRowInsets(EdgeInsets())
                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
            }
        .navigationBarTitle(Text("Featured"))
        .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                Text("User Profile")
            }
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[1].image.resizable()
    }
    
    
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(UserData())
    }
}
