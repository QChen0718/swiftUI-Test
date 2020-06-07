//
//  Landmark.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/7.
//  Copyright © 2020 陈庆. All rights reserved.
//  数据模型

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName:String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
// 获取json图片
extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
