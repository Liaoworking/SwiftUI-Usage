//
//  TransitionDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/11.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
struct TransitionDemo: View {
    @State var show = true
    var body: some View {
        VStack {
            Spacer()
            Text("Hello")
            //everytime when view show or hide,  I can use this.
            if show {
                Text("World")
                    .transition(.scale) // 可动画部件（包装在其中）
            }
            Spacer()
            Button(show ? "Hide" : "Show") {
                show.toggle()
            }
        }
        .animation(.easeInOut(duration:0.25), value: show) // 创建关联依赖、设定时序曲线函数
        .frame(width: 300, height: 300)
    }
}
