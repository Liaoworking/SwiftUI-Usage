//
//  NavigationHiddenDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/8.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
struct NavigationHiddenDemo: View {
    
    @Binding var showSelf: Bool
    @Binding var isNavigationBarHidden: Bool

    var body: some View {
        VStack {
            Button(action: {
                self.showSelf = false
                self.isNavigationBarHidden = false
            }) {
                Text("Pop")
            }
        }.onAppear {
            self.isNavigationBarHidden = true
        }
    }
}
 
