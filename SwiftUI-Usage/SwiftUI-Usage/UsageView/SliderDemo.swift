//
//  SliderDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/4.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
final class SliderData: ObservableObject {

  let didChange = PassthroughSubject<SliderData,Never>()

  var sliderValue: Float = 0 {
    willSet {
      print("sliderValueIsChanging😃\(newValue)")
      didChange.send(self)
    }
  }
}

struct SliderDemo: View {

    @State var progress: Double = 50
    
    @EnvironmentObject var sliderData: SliderData

    
    var body: some View {
        VStack {
            Slider(value: $progress,
                   in: 0...100, step: 0.1) { (isEditingChanged) in
                print("isEditingChanged\(isEditingChanged)")
            }
            .frame(width: 300, height: 30, alignment: .center)
            Text("current value:\(progress)")
            
            Slider(value: $sliderData.sliderValue,
                   in: 0...100,
                   step: 0.1,
                   onEditingChanged: { (_) in },
                   minimumValueLabel: Image(systemName: "sun.min.fill"),
                   maximumValueLabel: Image(systemName: "sun.max.fill")) {
                    Text("I have no idea here😑")
            }
            .accentColor(Color.green)
            .frame(width: 300, height: 30, alignment: .center)
            Text("you will see value is changing in the console")
        }
    }
}


#if DEBUG
struct SliderDemo_Preview: PreviewProvider {
    static var previews: SliderDemo {
        return SliderDemo()
    }
}
#endif
