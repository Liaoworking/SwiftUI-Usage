//
//  TabViewDemo2.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/9/15.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI

struct TabViewDemo2: View {
    var body: some View {
        TabView {
            Text("111111111")
            Text("222222")
            Text("3333")
            Text("44444")
            Text("555555")

        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

    }
}


#if DEBUG
struct TabViewDemo2_Preview: PreviewProvider {
    static var previews: TabViewDemo2 {
        return TabViewDemo2()
    }
}
#endif
