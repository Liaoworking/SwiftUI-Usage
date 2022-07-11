//
//  OthersAnimation.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/11.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
struct OthersAnimation: View {
    @State var show = true
    var body: some View {
        VStack{  //  使用布局容器
            if !show {
                Text("Hello")  // 分支一
                   .transition(.scale)
            } else {
                Text("Hello2")  // 分支二
                  .offset(y : 100)
                  .transition(.move(edge: .bottom))
            }
            
            // 代码二
            Text("Hello3")
                .offset(y : show ? 100 : 0)  // 同一视图两种状态声明
                .animation(.spring(), value: show)
            
            Button("tap") {
                show.toggle()
            }
            
        }
        .animation(.easeIn, value: show)
        

        
    }
}
