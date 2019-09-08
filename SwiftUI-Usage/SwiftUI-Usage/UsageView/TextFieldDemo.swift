//
//  TextFieldDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/3.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI
import Combine

struct TextFieldDemo: View {
    
    @State private var text: String = ""
    @State private var numberKeyBoardText: String = "numberKeyBoardTextHere"
    // TODO: max length to be done
    @State var maxLengthText: String = "textFieldMaxLength=20" {
        willSet {
            print("触发")
            self.maxLengthText = String(newValue.prefix(20))
        }
    }

    
    var body: some View {
                
    return GeometryReader { geometry in
        VStack(alignment: .leading, spacing: 10) {
            TextField("PlaceHolder Here", text: self.$numberKeyBoardText, onEditingChanged: { (isChange) in
                print("isChange\(isChange)")

            }) {
                print("Finished editing")
            }.keyboardType(.numberPad)
            .padding()
            .textFieldStyle(PlainTextFieldStyle())
            .border(Color.red, width: 1)
        

            TextField("PlaceHolder Here", text: self.$maxLengthText).textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.red)

            // There is no api for change placeHolder color here, you can use this trick way 😁
            ZStack(alignment: .leading) {
                TextField("", text: self.$text)
                    .background(Color.white)
                if self.text.isEmpty {
                    Text("RedColor_Placeholder")
                        .foregroundColor(.red)
                }
            }

            Text("Tap the blank space to hide the keyboard")

        }.frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            .background(Color.green)
        }.gesture(
            TapGesture().onEnded { (_) in
                print("tap event")
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                // or you can use this way to hide the keyboard
                //UIApplication.shared.keyWindow?.endEditing(true)
            }
        )
        .edgesIgnoringSafeArea(.all)
    }
}


#if DEBUG
struct TextFieldDemo_Preview: PreviewProvider {
    static var previews: TextFieldDemo {
        return TextFieldDemo()
    }
}
#endif

