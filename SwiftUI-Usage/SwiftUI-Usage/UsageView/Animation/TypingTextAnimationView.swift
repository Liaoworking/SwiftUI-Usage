//
//  TypingTextAnimationView.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/19.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct TypingTextAnimationViewDemo: View {
    
    @State var texts = ["1","2","3","4","5"]
    
    var body: some View {
        TypingTextAnimationView(contents: $texts)
    }
}


struct TypingTextAnimationViewModel {
    /// Dynamic string that animates the content property
    public var text: String = ""
    /// Text writing animation status
    public var writing: Bool = false
    /// Moving cursor animation status
    public var movingCursor: Bool = false
    /// Blinking cursor animation status
    public var blinkingCursor: Bool = false
    /// Indicates if a line contain the foreground delimiter character ('▮')
    public var isDelimiter: Bool = false
    
}

/// TypingTextAnimationViewModel+Methods
extension TypingTextAnimationViewModel {
    
    /// Fetch the cursor animation offset
    /// - Parameter charCount: Text that's being displayed character count
    /// - Returns CGFloat representing the cursor offset based on the text charCount
    public func getCursorOffset(charCount: Int) -> CGFloat {
        return self.movingCursor ? (75) : -CGFloat(charCount > 11 ? (charCount * 12) : (charCount >= 8 ? (charCount * 10) : (charCount)))
    }
}


struct TypingTextAnimationView: View {
    /// Type of the animation
    public let mode: TypingAnimationMode = .terminal
    /// The full raw content unanimated, source of the viewModel text property
    public let content: String = "Let's start from here."
    /// Parent contents used to control line changing
    @Binding public var contents: [String]
    @State internal var viewModel = TypingTextAnimationViewModel()
    
    var body: some View {
        self.createTextView().onAppear {
            // Text writing animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: mode == .terminal ? 2 : 1).delay(mode == .terminal ? 0 : 1).repeatForever(autoreverses: true)) {
                    viewModel.writing.toggle()
                    viewModel.movingCursor.toggle()
                }
            }

            
            // Cursor Blinking Animation
            withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                viewModel.blinkingCursor.toggle()
            }
        }
    }
    
    /// AssociatedType used to determine the animation mode
    @frozen internal enum TypingAnimationMode {
        case terminal, userInterface
    }
}

/// TypingTextAnimationView+Builders
extension TypingTextAnimationView {
    
    /// Creates an generic animated TextView
    /// - Returns specific TextView according to the chosen mode
    @ViewBuilder fileprivate func createTextView() -> some View {
        createTerminalText()
    }
    
    /// Creates an animated TerminalText
    /// - Returns TerminalText instance
    @ViewBuilder fileprivate func createTerminalText() -> some View {
        let smallText = self.content.count < 20
        HStack(spacing: 0) {
            Text(viewModel.text).frame(height: 40)
                //    .bold()
                .foregroundColor(.green)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .onChange(of: viewModel.text) { text in
//                    if text.count == self.content.count {
//                        let lineSize = self.content.count
//                        let timeForNextLine = CGFloat(smallText ? Double(lineSize / 5) : (Double(lineSize) * 0.08))
//                        DispatchQueue.main.asyncAfter(deadline: .now() + timeForNextLine) {
//                            self.contents.append(self.content)
//                        }
//                    }
                }
            
            if !self.contents.contains(self.content) {
                Text("|")
                    .font(.title2)
                    .foregroundColor(.green)
                    .opacity(viewModel.blinkingCursor ? 0 : 1)
            }
        }.onAppear {
            withAnimation(.easeInOut(duration: 1).delay(0).speed(smallText ? 1 : 0.35)) {
                for char in self.content {
                    viewModel.text.append(contentsOf: String("\(char)"))
                }
            }
        }
    }
}
