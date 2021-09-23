//
//  PopOverDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2021/7/1.
//  Copyright © 2021 Run Liao. All rights reserved.
//

import SwiftUI

struct PopOverDemo: View {
    @State private var showingPopover = false

    var body: some View {
        Image(systemName: "arrow.up.arrow.down").onTapGesture {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            VStack {
                Button("AlphaBelt") {
                    print("AlphaBelt")
                    showingPopover = false
                }
                Button("Date Added") {
                    print("Date Added")
                    showingPopover = false
                }
            }.padding()
        }
    }
}

struct PopOverDemo_Previews: PreviewProvider {
    static var previews: some View {
        PopOverDemo()
    }
}
