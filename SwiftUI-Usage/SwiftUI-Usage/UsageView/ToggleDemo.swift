//
//  ToggleDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/8.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI
import Combine
struct ToggleModel {
    var isWifiOpen: Bool = true {
        willSet {
            print("wifi status will change")
        }
    }
}

struct ToggleDemo: View {
    @State var model = ToggleModel()
    
    var body: some View {
        VStack {
            Toggle(isOn: $model.isWifiOpen) {
                HStack {
                    Image(systemName: "wifi")
                    Text("wifi")
                }
            }.accentColor(.pink)
            .padding()
            Text("""
                you can't change the tint color now
                you can use UISwitch and UIViewRepresentable to do this.
                """)
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
            
        }
    }
}


#if DEBUG
struct ToggleDemo_Preview: PreviewProvider {
    static var previews: ToggleDemo {
        return ToggleDemo()
    }
}
#endif
