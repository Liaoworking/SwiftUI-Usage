//
//  GestureDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/10.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI
import Combine
struct GestureDemo: View {
    
    @State var viewState: CGSize = .zero
    
    @State var tapTextColor: Color = .red
    @State var longPressTextColor: Color = .green

    
    var body: some View {
        VStack {
            Spacer()
            Text("tap me")
                .foregroundColor(tapTextColor)
                .onTapGesture {
                    self.tapTextColor = .yellow
                }
            
            Text("long press me")
                .foregroundColor(longPressTextColor)
                .onLongPressGesture {
                    self.longPressTextColor = .pink
                }
            Spacer()
            Text("drag me now😁")
            .offset(viewState)
            .gesture(
                DragGesture()
                    .onChanged({ (value) in
                        self.viewState = value.translation
                    })
                    .onEnded({ (_) in
                        self.viewState = .zero
                    })
            )
            Spacer()
        }
        .navigationBarTitle("Picker")
    }
}


#if DEBUG
struct GestureDemo_Preview: PreviewProvider {
    static var previews: GestureDemo {
        return GestureDemo()
    }
}
#endif
