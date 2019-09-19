//
//  LifeTimeDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/10.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI

/**
 here is an article to introduce life cycle in SwiftUI
 https://medium.com/flawless-app-stories/the-simple-life-cycle-of-a-swiftui-view-95e2e14848a2
 */

struct LifeCycleDemo: View {
    
    var body: some View {
        VStack {
            Text("LifeCycle")
        }.onAppear {
            print("onAppear")
        }.onDisappear {
            // if it was not called ， it may be a bug on beta version
            //https://stackoverflow.com/questions/57160288/why-view-ondisappear-not-get-called
            print("onDisappear")
        }
    }
}


#if DEBUG
struct LifeCycleDemo_Preview: PreviewProvider {
    static var previews: LifeCycleDemo {
        return LifeCycleDemo()
    }
}
#endif

