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
            // if you have a better idea to do like this, tell me now😺
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
                    Text("wifi")
                }
            }.accentColor(.pink)
            .padding()

            Toggle("", isOn: $model.isWifiOpen)
            .toggleStyle(
                ColoredToggleStyle(label: "My Colored Toggle",
                                   onColor: .green,
                                   offColor: .red,
                                   thumbColor: Color(UIColor.systemTeal)))
            
            
            
        }
    }
}


struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(Animation.easeInOut(duration: 0.1))
            }
        }
        .font(.title)
        .padding(.horizontal)
    }
}

#if DEBUG
struct ToggleDemo_Preview: PreviewProvider {
    static var previews: ToggleDemo {
        return ToggleDemo()
    }
}
#endif
