//
//  IsContinuous.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/10.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI
struct IsContinuous: View {
    @GestureState var position: CGPoint = .zero
    var body: some View {
        VStack {
            Circle()
                .fill(.orange)
                .frame(width: 30, height: 50)
                .offset(x: position.x, y: position.y)
                .transaction {
                    if $0.isContinuous {
                        $0.animation = nil // 拖动时，不设置时序曲线函数
                    } else {
                        $0.animation = .easeInOut(duration: 1)
                    }
                }
                .gesture(
                    DragGesture()
                        .updating($position, body: { current, state, transaction in
                            state = .init(x: current.translation.width, y: current.translation.height)
                            transaction.isContinuous = true // 拖动时，设置标识
                        })
                )
        }
        .frame(width: 400, height: 500)
    }
}
