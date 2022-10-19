//
//  TextSelectionDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/10/19.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
struct TextSelectionDemo: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            Spacer()
//            Text("Copyright © 2022 Run Liao. All rights reserved.").textSelection(.enabled)
            
            HoverSentenceView("Copyright © 2022 Run Liao. All rights reserved.")
            
            // TODO: Get the width of text?
            Spacer()
        }
        
    }
}

struct HoverSentenceView: View {
    
    var sentence: String
    var words: [String]
    
    init(_ content: String) {
        self.sentence = content
        self.words = content.wordsSeperator
    }
        
    var body: some View {
        HStack {
            ForEach(1..<words.count, id: \.self) { item in
                ClickToShowExplainWord(words[item])
            }
        }
    }
}

struct ClickToShowExplainWord: View {
    
    init(_ content: String) {
        self.word = content
    }
    
    let word: String
    
    @State var isPresented: Bool = false
    
    var body: some View {
        Text(word).foregroundColor(isPresented ? .black : .red)
            .onTapGesture {
                isPresented.toggle()
            }.popover(isPresented: $isPresented) {
            Text("aaaaa")
        }
    }
}

extension String {
    var wordsSeperator: [String] {
        
        return components(separatedBy: " ")
        
    }
}


#if DEBUG
struct TextSelectionDemo_Preview: PreviewProvider {
    static var previews: TextSelectionDemo {
        return TextSelectionDemo()
    }
}
#endif
