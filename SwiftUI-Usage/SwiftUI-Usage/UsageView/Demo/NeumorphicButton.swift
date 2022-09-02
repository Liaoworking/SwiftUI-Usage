//
//  NeumorphicButton.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/9/2.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct NeumorphicButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Get Started").raisedButtonTextStyle()
        }.buttonStyle(RaisedButtonStyle())
    }
}

struct NeumorphicButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            NeumorphicButton().padding(20)
        }
        .background(Color("background"))
        .previewLayout(.sizeThatFits)
    }
}

extension Text {
    
    func raisedButtonTextStyle() -> some View {
        self.font(.body).fontWeight(.bold)
    }
    
}


struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
//            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 12, leading: 30, bottom: 12, trailing: 30))
            .background(
                Capsule()
                    .foregroundColor(Color("neumorphic-button-background"))
                    .shadow(color: Color("neumorphic-button-drop-shadow"), radius: 4, x: 6, y: 6)
                    .shadow(color: Color("neumorphic-button-drop-highlight"), radius: 4, x: -6, y: -6)
                
            )
    }
}
