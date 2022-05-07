//
//  ScrollViewReaderDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/5/7.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct ScrollViewReaderDemo: View {
    @State private var num = 20
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ZStack {
                    List {
                        ForEach(1..<100, id: \.self) { item in
                            Text("Number" + String(item))
                                .id(item)
                        }
                    }
                }
                Button {
                    withAnimation {
                        proxy.scrollTo(num, anchor: .top)
                    }
                } label: {
                    Text("jump to selected number")
                }
            }
        }
    }
}
struct ScrollViewReaderDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderDemo()
    }
}
