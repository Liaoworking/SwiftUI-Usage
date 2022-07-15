//
//  ListGeometryReader.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/15.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct ListGeometryReader: View {
//    var body: some View {
//            GeometryReader { geometry in
//                List(TestEnum.allCases) { listValue in
//                    Text(listValue.id)
//                        .padding(60)
//                        .transformAnchorPreference(key: MyKey.self, value: .bounds) {
//                            $0.append(MyFrame(id: listValue.id, frame: geometry[$1]))
//                        }
//                        .onPreferenceChange(MyKey.self) {
//                            print($0)
//                            // Handle content frame changes here
//                        }
//                }
//            }
//        }
    
    var body: some View {
        GeometryReader { geometry in
            List {
                Text("")
                    .transformAnchorPreference(key: MyKey.self, value: .bounds) {
                        $0.append(MyFrame(id: "tableTopCell", frame: geometry[$1]))
                    }
                    .onPreferenceChange(MyKey.self) {
                        print($0.first?.frame)
                        // Handle top view frame changes here.
                        // This only gets reported as long as this
                        // top view is part of the content. This could be
                        // removed when not visible by the List internals.
                    }
                ForEach(TestEnum.allCases) {
                    Text($0.rawValue)
                        .padding(60)
                }
                
                Text("")
                    .transformAnchorPreference(key: FooterKey.self, value: .bounds) {
                        $0.append(MyFrame(id: "bottomView", frame: geometry[$1]))
                    }
                    .onPreferenceChange(FooterKey.self) {
                        print($0.first?.frame)
                        // Handle top view frame changes here.
                        // This only gets reported as long as this
                        // top view is part of the content. This could be
                        // removed when not visible by the List internals.
                    }
                
            }
        }
    }
    
}

struct MyFrame : Equatable {
    let id : String
    let frame : CGRect

    static func == (lhs: MyFrame, rhs: MyFrame) -> Bool {
        lhs.id == rhs.id && lhs.frame == rhs.frame
    }
}

struct MyKey : PreferenceKey {
    typealias Value = [MyFrame] // The list of view frame changes in a View tree.

    static var defaultValue: [MyFrame] = []

    /// When traversing the view tree, Swift UI will use this function to collect all view frame changes.
    static func reduce(value: inout [MyFrame], nextValue: () -> [MyFrame]) {
        value.append(contentsOf: nextValue())
    }
}

struct FooterKey : PreferenceKey {
    typealias Value = [MyFrame] // The list of view frame changes in a View tree.

    static var defaultValue: [MyFrame] = []

    /// When traversing the view tree, Swift UI will use this function to collect all view frame changes.
    static func reduce(value: inout [MyFrame], nextValue: () -> [MyFrame]) {
        value.append(contentsOf: nextValue())
    }
}

enum TestEnum : String, CaseIterable, Identifiable {
    case one, two, three, four, five, six, seven, eight, nine, ten, q,w,e,e3,r4,t4,ty,c5,hg4,g55,g66,g5

    var id: String {
        rawValue
    }
}


struct ListGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        ListGeometryReader()
    }
}
