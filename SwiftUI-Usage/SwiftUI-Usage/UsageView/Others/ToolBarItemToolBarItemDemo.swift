//
//  ToolBarItem.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2020/7/18.
//  Copyright © 2020 Run Liao. All rights reserved.
//

import SwiftUI

struct ToolBarItemDemo: View {
    let messages: [String] = ["toolbarDemo"]

    var body: some View {
        List(messages, id: \.self) { message in
            Text(message)
        }
        .navigationTitle("toolbarDemo")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("New") {}
            }
            ToolbarItem(placement: .bottomBar) {
                Button("Filter") {}
            }
  
            ToolbarItem(placement: .bottomBar) {
                Button("Filter") {}
            }
        }
    }
}


struct ToolBarItem_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarItemDemo()
    }
}
