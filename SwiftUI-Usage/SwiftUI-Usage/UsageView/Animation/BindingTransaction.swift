//
//  BindingTransaction.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/11.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI


struct BindingTransaction: View {

    var body: some View {
        BindingTransactionDemo(animation: .easeInOut)
    }
}

struct BindingTransactionDemo: View {
    @State var animated = false
    let animation: Animation?

    var animatedBinding: Binding<Bool> { // 生成包含指定 Transaction 的 Binding 类型
        let transaction = Transaction(animation: animation)
        return $animated.transaction(transaction)
    }

    var body: some View {
        VStack {
            Text("Hi")
                .offset(x: animated ? 100 : 0)

            Toggle("Animated", isOn: animatedBinding) // 点击时会自动产生动画效果
        }
        .frame(width: 400, height: 500)
    }
}

