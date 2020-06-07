//
//  LandmarkRow.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/7.
//  Copyright © 2020 陈庆. All rights reserved.
//  cell

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View{
        HStack {
            landmark.image
            .resizable()
            .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
    
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarkData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
