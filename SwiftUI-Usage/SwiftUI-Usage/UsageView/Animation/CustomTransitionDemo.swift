//
//  CustomTransitionDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/11.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI

struct MyTransition: ViewModifier { // 自定义转场的包装对象要求符合 ViewModifier 协议
    let rotation: Angle
    func body(content: Content) -> some View {
        content
            .rotationEffect(rotation) // 可动画部件
    }
}

extension AnyTransition {
    static var rotation: AnyTransition {
        AnyTransition.modifier(
            // 结束状态
            active: MyTransition(rotation: .degrees(360)),
            // 初始状态
            identity: MyTransition(rotation: .degrees(90))
        )
    }
}

struct CustomTransitionDemo: View {
    @State var show = true
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("Hello")
                if show {
                    Text("World")
                        .transition(.rotation.combined(with: .opacity).combined(with: .slide))
                }
                Spacer()
            }
            .animation(.easeInOut(duration: 2), value: show) // 在这里声明，Button 的文字将没有动画效果
            Button(show ? "Hide" : "Show") {
                show.toggle()
            }
        }
//        .animation(.easeInOut(duration: 2), value: show) // 如果在这里声明，对 Button 的文字同样有影响，结果如下图
        .frame(width: 300, height: 300)
        .onChange(of: show) {
            print($0)
        }
    }
}
