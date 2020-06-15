//
//  CustomerView.swift
//  swiftui_demo
//
//  Created by 陈庆 on 2020/6/9.
//  Copyright © 2020 陈庆. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct CustomerView: View {
    fileprivate var customerlistvm = CustomerListVM()
   @State fileprivate var modelArray:[CustomerListDataModel] = []
    init() {
        
    }
    var body: some View {
        NavigationView {
            VStack {
                List(self.modelArray,id: \.id){ model in
                    NavigationLink(destination: (CustomerViewDetail())){
                        HStack{
                            WebImage(url: URL(string:HTTP_IMAGE_DOWNLOAD_REQUEST_URL +  model.photo)).resizable().scaledToFit().frame(width: 54, height: 54, alignment: .center)
                            VStack(alignment:.leading){
                                Text(model.name)
                                Text("最近访问："+model.lastLoginTime)
                                HStack{
                                    ForEach(model.tagList){ tagname in
                                        Text("测试")
                                    }
                                    
                                    Text("内容")
                                }
                            }
                            Spacer()
                            VStack(alignment:.trailing){
                                Text(model.totalPrice)
                                Text("累计交易")
                            }
                        }
                        
                    }
                }

                Button(action: {
                    self.loadData()
                    }) {
                        Text("Start").font(.largeTitle).foregroundColor(.red)
                }
            }
        .navigationBarTitle("客户")
        }
    }
     func loadData() {
        self.customerlistvm.startLoad { modelarray in
            self.modelArray = modelarray ?? []
        }
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
