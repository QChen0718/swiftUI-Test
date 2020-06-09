//
//  LandmarkDetail.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/5.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    @State private  var name = ""
    @State private var age = 18
    @State private var password = ""
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex { (land) -> Bool in
            land.id == landmark.id
            }!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
            .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment:.leading) {
                HStack {
                    Text(landmark.name).font(.title)
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite{
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }else {
                            Image(systemName: "star").foregroundColor(Color.gray)
                        }
                    }
                    
                }
                HStack(alignment:.top) {
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
            }
//                1
//            TextField("你的名字", text: $name)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.numberPad)
//                2
//                TextField("你的名字", text: $name)
//            .padding()
//                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red,lineWidth: 3))
//                    3.结束编辑时取得使用者输入的文字
            TextField("你的名字",text: $name,onEditingChanged: { (editing) in
                print("onEditingChanged",editing)
            }){
                print(self.name)
            }
        .textFieldStyle(RoundedBorderTextFieldStyle())
//                4.按钮点击输出键盘输入的内容
                TextField("你的年纪", value: $age, formatter: NumberFormatter())
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            Button("输出年纪"){
                print(self.age)
            }
//                5.密码键盘
                SecureField("password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
      return  LandmarkDetail(landmark: userData.landmarks[0]).environmentObject(userData)
    }
}
