//
//  ContentView.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/5.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI

struct Pokemon {
    let name:String
    let type:String
    let color:Color
    let imagename:String
}
struct ContentView: View {
    var pokemonList = [
        Pokemon(name: "Charmander", type: "Fire", color: .red,imagename: "list_image1"),
        Pokemon(name: "Squirtle", type: "Water", color: .blue,imagename: "list_image2"),
        Pokemon(name: "Bulbasaur", type: "Grass", color: .green,imagename: "list_image3"),
        Pokemon(name: "Pikachu", type: "Electric", color: .yellow,imagename: "list_image4"),
    ]
    var body: some View {
        NavigationView {
            List(pokemonList,id: \.name) { item in
                NavigationLink(destination: LandmarkDetail()){
                    HStack(alignment:.center){
                        Image(item.imagename)
                            .padding()
                        VStack(alignment: .leading, spacing:15){
                            Text(item.name)
                            HStack{
                                Text("2020-06-05")
                                Spacer()
                               Text(item.type).foregroundColor(item.color)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("历史分享"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
