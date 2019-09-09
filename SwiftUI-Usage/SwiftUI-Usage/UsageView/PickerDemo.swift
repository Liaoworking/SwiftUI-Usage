//
//  PickerDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/8.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI

struct PickerDemo: View {
    @State var selection: Int = 0
    @State var mapChoioce = 0
    var settings = ["Music", "Video", "Image"]
    var dateInfo = ["Yesterday", "Today","Tomorrow"]
    var body: some View {
        VStack {
            Spacer()
            Picker("Options", selection: $mapChoioce) {
                 ForEach(0 ..< settings.count) { index in
                     Text(self.settings[index])
                        .tag(index)
                 }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Form{
                Picker(selection: $selection, label:
                    Text("Date")
                    , content: {
                        Text("Yesterday").tag(0).foregroundColor(.yellow)
                        Text("Today").tag(1)
                        Text("Tomorrow").tag(2)
                })
                .pickerStyle(DefaultPickerStyle())
            }
            
            Picker(selection: $selection, label:
                Text("Date").foregroundColor(.red)
                , content: {
                    HStack {
                        Image(systemName: "smiley")
                        Text("Yesterday")
                    }.tag(0)
                    Text("Today").tag(1)
                    Text("Tomorrow").tag(2)
            }).pickerStyle(WheelPickerStyle())

            Spacer()
        }.navigationBarTitle("Picker")
    }
}


#if DEBUG
struct PickerDemo_Preview: PreviewProvider {
    static var previews: PickerDemo {
        return PickerDemo()
    }
}
#endif
