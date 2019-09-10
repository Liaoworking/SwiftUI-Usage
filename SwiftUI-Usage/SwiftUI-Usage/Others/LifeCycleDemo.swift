//
//  LifeTimeDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/10.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI
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

