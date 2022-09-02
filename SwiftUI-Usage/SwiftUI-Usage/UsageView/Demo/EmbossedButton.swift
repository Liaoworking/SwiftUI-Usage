//
//  EmbossedButton.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/9/2.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct EmbossedButton: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

enum EmbossedButtonShape {
    case round, capsule
}

struct EmbossedButtonStyle: ButtonStyle {
    
    var buttonShape = EmbossedButtonShape.round
    
//    func makeBody(configuration: Configuration) -> some View {
//        return configuration
//            .label
//            .padding(10)
////            .background({
////                GeometryReader { proxy in
////                }
////            })
//    }
    
    @ViewBuilder
    func shape(size: CGSize) -> some View {
        
    }
    
}

struct EmbossedButton_Previews: PreviewProvider {
    static var previews: some View {
        EmbossedButton()
    }
}
