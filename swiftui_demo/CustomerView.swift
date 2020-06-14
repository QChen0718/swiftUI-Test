//
//  CustomerView.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/9.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI

struct CustomerView: View {
    fileprivate var customerlistvm = CustomerListVM()
    fileprivate var modelArray:[CustomerListDataModel] = []
    @State private var names = ""
    init() {
       loadData()
    }
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: (CustomerViewDetail())){
                    Text(names)
                }

                Button(action: {
                    self.loadData()
                    }) {
                        Text("Start").font(.largeTitle).foregroundColor(.red)
                }
            }
        }
    }
    func loadData() {
        self.customerlistvm.startLoad { modelarray in
            
            self.names = modelarray?[0].name ?? ""
        }
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
