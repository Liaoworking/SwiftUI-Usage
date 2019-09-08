//
//  TabViewDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/8.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
struct TabViewDemo: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem({
                    VStack{ // use VStack same apparence
                        Image(systemName: "house")
                        Text("Home")
                    }
                })
                .tag(0)
            Text("Second View")
                .tabItem({ // not Use Vstack same apparence
                        Image(systemName: "person")
                        Text("Mine").foregroundColor(.yellow)
                })
                .tag(1)
        }.accentColor(.red)
    }
}


#if DEBUG
struct TabViewDemo_Preview: PreviewProvider {
    static var previews: TabViewDemo {
        return TabViewDemo()
    }
}
#endif
