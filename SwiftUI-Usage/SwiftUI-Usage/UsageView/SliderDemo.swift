//
//  SliderDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/4.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
struct SliderDemo: View {

    @State var progress: Double = 50
    
    var body: some View {
        VStack {
           Slider(value: $progress, in: 0...100, step: 0.1).frame(width: 300, height: 30, alignment: .center)
            Text("current value:\(progress)")
        }
    }
}


#if DEBUG
struct SliderDemo_Preview: PreviewProvider {
    static var previews: SliderDemo {
        return SliderDemo()
    }
}
#endif
