//
//  ToggleDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/8.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI

struct ToggleDemo: View {
    @State var isShowing = true
    var body: some View {
        // TODO: how to observe value change event?
        Toggle(isOn: $isShowing) {
            HStack {
                Image(systemName: "wifi")
                Text("wifi")
            }
        }.padding()
    }
}


#if DEBUG
struct ToggleDemo_Preview: PreviewProvider {
    static var previews: ToggleDemo {
        return ToggleDemo()
    }
}
#endif
