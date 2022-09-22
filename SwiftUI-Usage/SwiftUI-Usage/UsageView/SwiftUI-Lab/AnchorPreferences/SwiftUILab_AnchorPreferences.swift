//
//  SwiftUILab_AnchorPreferences.swift
//  SwiftUI-Usage
//
//  Created by liaoworking on 2020/3/20.
//  Copyright © 2020 Run Liao. All rights reserved.
//

import SwiftUI

struct SwiftUILab_AnchorPreferences: View {
    @State private var activeIdx: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                MonthView(activeMonth: $activeIdx, label: "January", idx: 0)
                MonthView(activeMonth: $activeIdx, label: "February", idx: 1)
                MonthView(activeMonth: $activeIdx, label: "March", idx: 2)
                MonthView(activeMonth: $activeIdx, label: "April", idx: 3)
            }
            
            Spacer()
            
            HStack {
                MonthView(activeMonth: $activeIdx, label: "May", idx: 4)
                MonthView(activeMonth: $activeIdx, label: "June", idx: 5)
                MonthView(activeMonth: $activeIdx, label: "July", idx: 6)
                MonthView(activeMonth: $activeIdx, label: "August", idx: 7)
            }
            
            Spacer()
            
            HStack {
                MonthView(activeMonth: $activeIdx, label: "September", idx: 8)
                MonthView(activeMonth: $activeIdx, label: "October", idx: 9)
                MonthView(activeMonth: $activeIdx, label: "November", idx: 10)
                MonthView(activeMonth: $activeIdx, label: "December", idx: 11)
            }
            
            Spacer()
        }.overlayPreferenceValue(GHTestPreferenceKey.self) { preferences in
            GeometryReader { geometry in
                ZStack {
                    self.createBorder(geometry, preferences)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
    
    func createBorder(_ geometry: GeometryProxy, _ preferences: [MyTextPreferenceData]) -> some View {
        let p = preferences.first(where: { $0.viewIdx == self.activeIdx })
        
        let bounds = p != nil ? geometry[p!.bounds] : .zero
        print("\(bounds.size.width)__\(bounds.size.height)")
        return RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3.0)
            .foregroundColor(Color.green)
            .frame(width: bounds.size.width, height: bounds.size.height)
            .fixedSize()
            .offset(x: bounds.minX, y: bounds.minY)
            .animation(.easeInOut(duration: 1.0))
    }
}

struct MyTextPreferenceData {
    let viewIdx: Int
    let bounds: Anchor<CGRect>
}

struct GHTestPreferenceKey: PreferenceKey {
    static var defaultValue: [MyTextPreferenceData] = []
    
    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
    
    typealias Value = [MyTextPreferenceData]
}

//struct MyTextPreferenceKey: PreferenceKey {
//    typealias Value = [MyTextPreferenceData]
//
//    static var defaultValue: [MyTextPreferenceData] = []
//
//    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
//        value.append(contentsOf: nextValue())
//    }
//}

struct MonthView: View {
    @Binding var activeMonth: Int
    let label: String
    let idx: Int
    
    var body: some View {
        Text(label)
            .padding(10).background(Color.pink)
            .anchorPreference(key:GHTestPreferenceKey.self,value: .bounds, transform: {[MyTextPreferenceData(viewIdx: self.idx, bounds: $0)]})
            .onTapGesture { self.activeMonth = self.idx }
    }
}

struct SwiftUILab_AnchorPreferences_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILab_AnchorPreferences()
    }
}
