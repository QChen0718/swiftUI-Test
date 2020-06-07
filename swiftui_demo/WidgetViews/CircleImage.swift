//
//  CircleImage.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/7.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image:Image
    var body: some View {
        image.clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 4))
        .shadow(radius: 10)
    }
}
// 创建预览视图的方法
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}

