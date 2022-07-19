//
//  TypingTextDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/19.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct TypingTextDemo: View {
        
    let contentText = "et's start from here."
    
    @State var displayText: String = "L"

    @State var blinkingCursor: Bool = false

    var body: some View {
        HStack {
            Text(displayText)
            
            Text("|")
                .font(.title2)
                .foregroundColor(.black)
                .opacity(blinkingCursor ? 0 : 1)
                .offset(x: -5)
            
        }.onAppear(perform: {

            withAnimation(.easeInOut(duration: 1).delay(1).speed(0.6)) {
                for chara in contentText {
                    displayText.append(chara)
                }
            }
            
            // Cursor Blinking Animation
            withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                blinkingCursor.toggle()
            }
            
        })
    }
}

struct TypingTextDemo_Previews: PreviewProvider {
    static var previews: some View {
        TypingTextDemo()
    }
}
