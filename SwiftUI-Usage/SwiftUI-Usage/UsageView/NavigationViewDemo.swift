//
//  NavigationView.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/8.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI
//https://swiftui-lab.com/geometryreader-to-the-rescue/
struct NavigationViewDemo: View {

    @State var text: String = "TextField here"

    @State var showDetail = false
    @State var isNavigationBarHidden = false
    
    var body: some View {
         VStack {
            NavigationLink(destination: NavigationHiddenDemo(showSelf: self.$showDetail, isNavigationBarHidden: self.$isNavigationBarHidden), isActive: self.$showDetail) {
               Text("Push To Navigation Hidden")
           }.navigationBarTitle(Text("title"), displayMode: .inline)
                .navigationBarHidden(self.isNavigationBarHidden)
            // you can use navigationBarBackButtonHidden to hide back item
            // .navigationBarBackButtonHidden(true)
         }
        .navigationBarItems(
        trailing:
            HStack {
                Button(action: {
                    print("Btn clicked here")
                }){
                    Text("Button")
                }
            }
        )
        .navigationBarBackButtonHidden(false)
    }
}


#if DEBUG
struct NavigationViewDemo_Preview: PreviewProvider {
    static var previews: NavigationViewDemo {
        return NavigationViewDemo()
    }
}
#endif
