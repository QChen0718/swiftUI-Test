//
//  TabbarControl.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/9.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI

struct TabbarControl: View {
    var body: some View {
        TabView{
            CategoryHome().environmentObject(UserData()).tabItem {
                
                Text("首页").font(.system(size: 24)).foregroundColor(Color.red)
            }
            CustomerView().tabItem {
               Text("客户")
            }
        }
    }
}

struct TabbarControl_Previews: PreviewProvider {
    static var previews: some View {
        TabbarControl()
    }
}
