//
//  CustomerView.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/9.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI

struct CustomerView: View {
    var body: some View {
        NavigationView {
            List(0..<5){_ in
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                .navigationBarTitle("客户",displayMode: .inline)
            }
            
        }
        
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
