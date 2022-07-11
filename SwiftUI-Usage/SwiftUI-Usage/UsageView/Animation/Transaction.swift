//
//  TransactionAnimation.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/10.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI
struct TransactionAnimation: View {
    @State var position: CGFloat = 40
    var body: some View {
        VStack {
            Text("Hi")
                .offset(x: position, y: position)
                .animation(.easeInOut, value: position)

            Slider(value: $position, in: 0...150)
            Button("Animate") {
                var transaction = Transaction() // 没有指定时序曲线函数，将保留原有设置（本例为 easeInOut）
                if position < 100 { transaction.disablesAnimations = true }
                withTransaction(transaction) { // withTransaction 可以禁止原有事务的时序曲线函数（由 animation 相关联），但无法屏蔽由 transaction 关联的时序曲线函数
                    position = 0
                }
            }
        }
        .frame(width: 400, height: 500)
    }
}
