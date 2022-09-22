//
//  DIYSegmentView.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/9/21.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct DIYSegmentViewDemo: View {
    
    var body: some View {
        DIYSegmentView(items: ["testt1", "Testts","1"]) { _ in
            
        }
    }
    
    
}

struct DIYSegmentView: View {
    
    var items:[String]
    
    var onSelected:(Int) -> ()
    
    @State var selectedIdx: Int = 0
    
    var hMargin: CGFloat = 15.0
    
    var body: some View {
        
        VStack {
            HStack(spacing: 15){
                ForEach(0 ..< items.count) { index in
                    Text(self.items[index])
//                        .font(.headline)
//                        .opacity(selectedIdx == index ? 1.0 : 0.5)
                        .anchorPreference(key: MYSegmentTextPreferenceKey.self, value: .bounds, transform: { anchor in
                            return [MYSegmentPreferenceData(viewIndx: index, bounds: anchor)]
                        })

                       .tag(index)
                       .onTapGesture {
                           selectedIdx = index
                           onSelected(index)
                       }
                }
            }.padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            .backgroundPreferenceValue(MYSegmentTextPreferenceKey.self) { preferences in
                
                GeometryReader { geometry in
                    createScrollBG(geometry, preferences)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity,
                               alignment: .topLeading)
                }
                
            }
        }.background(Color.green).zIndex(-100)
        .clipShape(Capsule())

    }
    
    func createScrollBG(_ geometry: GeometryProxy, _ preferences: [MYSegmentPreferenceData]) -> some View {
        
        let p = preferences.first(where: {$0.viewIndx == selectedIdx})
        
        let bounds = p != nil ? geometry[p!.bounds] : .zero
        let margin: CGFloat = 7.5
        
        return Color.yellow
            .frame(width: bounds.width + margin * 2, height: bounds.height)
            .clipShape(Capsule())
            .offset(x:bounds.minX - margin, y: bounds.minY)
            .animation(.easeInOut(duration: 0.25))
    }
    
    func getXOffset(of proxyWidth: CGFloat) -> CGFloat {
        return proxyWidth * CGFloat(selectedIdx) / CGFloat(items.count) + hMargin
    }
}

struct MYSegmentPreferenceData {
    let viewIndx: Int
//    let topLeading: Anchor<CGPoint>?
//    var bottomTrailing: Anchor<CGPoint>?
    let bounds: Anchor<CGRect>

}

struct MYSegmentTextPreferenceKey: PreferenceKey {
    
    typealias Value = [MYSegmentPreferenceData]

    static var defaultValue: [MYSegmentPreferenceData] = []
    
    static func reduce(value: inout [MYSegmentPreferenceData], nextValue: () -> [MYSegmentPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}


struct DIYSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        DIYSegmentViewDemo()
    }
}
