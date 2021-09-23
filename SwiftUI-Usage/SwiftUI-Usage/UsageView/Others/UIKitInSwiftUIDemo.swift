//
//  UIKitInSwiftUIDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2021/9/16.
//  Copyright © 2021 Run Liao. All rights reserved.
//

import SwiftUI

struct UIKitInSwiftUIDemo: View {
    @State var name: String = ""
    @State var color: UIColor = .red
    var body: some View {
        VStack {
            TextFieldWrapper("name:",
                             text: $name,
                             color: color,
                             font: .preferredFont(forTextStyle: .title1),
                             clearButtonMode: .whileEditing,
                             onCommit: { print("return") },
                             onEditingChanged: { editing in print("isEditing \(editing)") })
//                .border(.blue)
                .padding()
            Text("name:\(name)")
            Button("Random Name") {
                name = String(Int.random(in: 0...100))
            }
            Button("Change Color") {
                color = color == .red ? .label : .red
            }
        }
    }
}

struct UIKitInSwiftUIDemo_Previews: PreviewProvider {
    static var previews: some View {
        UIKitInSwiftUIDemo()
    }
}



struct TextFieldWrapper: UIViewRepresentable {
    init(_ placeholder: String,
         text: Binding<String>,
         color: UIColor = .label,
         font: UIFont = .preferredFont(forTextStyle: .body),
         clearButtonMode:UITextField.ViewMode = .whileEditing,
         onCommit: @escaping () -> Void = {},
         onEditingChanged: @escaping (Bool) -> Void = { _ in }
    )
    {
        self.placeholder = placeholder
        self._text = text
        self.color = color
        self.font = font
        self.clearButtonMode = clearButtonMode
        self.onCommit = onCommit
        self.onEditingChanged = onEditingChanged
    }
    let placeholder: String
    @Binding var text: String
    let color: UIColor
    let font: UIFont
    let clearButtonMode: UITextField.ViewMode
    var onCommit: () -> Void
    var onEditingChanged: (Bool) -> Void
    typealias UIViewType = UITextField
    func makeUIView(context: Context) -> UIViewType {
        let textfield = UITextField()
        textfield.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textfield.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textfield.placeholder = placeholder
        textfield.delegate = context.coordinator
        return textfield
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
//        DispatchQueue.main.async {
//            uiView.text = text
//            uiView.textColor = color
//            uiView.font = font
//            uiView.clearButtonMode = clearButtonMode
//        }
    }
    func makeCoordinator() -> Coordinator {
        .init(text: $text,onCommit: onCommit,onEditingChanged: onEditingChanged)
    }
}

extension TextFieldWrapper {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var onCommit: () -> Void
        var onEditingChanged: (Bool) -> Void
        init(text: Binding<String>,
             onCommit: @escaping () -> Void,
             onEditingChanged: @escaping (Bool) -> Void) {
            self._text = text
            self.onCommit = onCommit
            self.onEditingChanged = onEditingChanged
        }
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text as NSString? {
                let finaltext = text.replacingCharacters(in: range, with: string)
                self.text = finaltext as String
            }
            return true
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            onCommit()
            return true
        }
        func textFieldDidBeginEditing(_ textField: UITextField) {
            onEditingChanged(true)
        }
        func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            onEditingChanged(false)
        }
    }
}
