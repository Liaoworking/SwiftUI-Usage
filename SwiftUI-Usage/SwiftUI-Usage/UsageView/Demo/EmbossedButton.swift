//
//  EmbossedButton.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/9/2.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct EmbossedButtonDemo: View {
    
    var body: some View {
        EmbossedButton(buttonText: "Hiiii", action: {
            
        }, buttonShape: .capsule)
    }
    
}

struct EmbossedButton: View {
    
    let buttonText: String
    let action: () -> Void
    var buttonShape: EmbossedButtonShape
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }.buttonStyle(EmbossedButtonStyle(buttonShape: buttonShape))

    }
}

enum EmbossedButtonShape {
    case round, capsule
}

struct EmbossedButtonStyle: ButtonStyle {
    
    var buttonShape = EmbossedButtonShape.round
    
    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color("neumorphic-button-drop-shadow")
        let highlight = Color("neumorphic-button-drop-highlight")
        return configuration.label
            .padding(10)
            .background(
                GeometryReader { proxy in
                    shape(size: proxy.size)
                        .foregroundColor(Color("neumorphic-button-background"))
                        .shadow(color: shadow, radius: 1, x: 2, y: 2)
                        .shadow(color: highlight, radius: 1, x: -2, y: -2)
                        .offset(x: -1, y: -1)
                }
            )
    }
    
    @ViewBuilder
    func shape(size: CGSize) -> some View {
        switch buttonShape {
        case .round:
            Circle()
                .stroke(Color("neumorphic-button-background"))
                .frame(width: max(size.width, size.height), height: max(size.width, size.height))
                .offset(x: -1)
                .offset(y: -max(size.width, size.height) / 2 + min(size.height, size.width) / 2)
        case .capsule:
            Capsule().stroke(Color("neumorphic-button-background"), lineWidth: 2)
        }
    }
    
}

struct EmbossedButton_Previews: PreviewProvider {
    static var previews: some View {
        EmbossedButton(buttonText: "hiii", action: {}, buttonShape: .capsule)
            .background(Color("neumorphic-button-background"))
            .previewLayout(.sizeThatFits)
    }
}
