//
//  CompatibleScrollView.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2025/3/20.
//  Copyright © 2025 Run Liao. All rights reserved.
//

import SwiftUI

struct CustomScrollView<Content: View>: View {
    let content: Content
    @Binding var scrollToItem: Int?  // 用来绑定滚动目标

    @available(macOS 11.0, *)

    init(scrollToItem: Binding<Int?>, @ViewBuilder content: () -> Content) {
        self._scrollToItem = scrollToItem
        self.content = content()
    }

    var body: some View {
        if #available(macOS 11.0, *) {
            ScrollViewReader { scrollView in
                ScrollView {
                    content
                }
                .onChange(of: scrollToItem) { newIndex in
                    // 当 scrollToItem 发生变化时，滚动到指定位置
                    if let index = newIndex {
                        scrollView.scrollTo(index, anchor: .top)  // 这里可以设置滚动到的位置
                    }
                }
            }
        } else {
            ScrollView {
                content
            }
        }
    }
}

struct CustomScrollViewDemo: View {
    @State private var scrollToItem: Int? = nil
    
    var body: some View {
        VStack {
            Button("Scroll to Item 50") {
                scrollToItem = 50
            }
            
            CustomScrollView(scrollToItem: $scrollToItem) {
                VStack {
                    ForEach(0..<100, id: \.self) { index in
                        Text("Item \(index)")
                            .id(index)  // 给每个元素设置一个id，ScrollViewReader可以根据这个id滚动
                            .padding()
                    }
                }
            }
        }
        .frame(width: 300, height: 400)
    }
}
