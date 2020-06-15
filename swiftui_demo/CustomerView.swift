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
       loadData()
    }
    var body: some View {
        NavigationView {
            VStack {
                List(self.modelArray){ model in
                    NavigationLink(destination: (CustomerViewDetail())){
                        HStack{
                            WebImage(url: URL(string:HTTP_IMAGE_DOWNLOAD_REQUEST_URL +  model.photo)).resizable().scaledToFit().frame(width: 54, height: 54, alignment: .center)
                            VStack(alignment:.leading){
                                Text(model.name)
                                Text("最近访问：" + model.lastLoginTime)
                                HStack{
                                    ForEach(model.tagList,id: \.self){ tagname in
                                        Text(tagname)
                                    }
                                }
                            }
                            Spacer()
                            VStack(alignment:.trailing){
                                Text(model.totalPrice)
                                Text("累计交易")
                            }
                        }.padding(.top,10)
                            .padding(.bottom,10)
                            

                    }
                }
                .padding(.leading, -5)
//
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
            print(self.modelArray)
        }
    }
}
struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
