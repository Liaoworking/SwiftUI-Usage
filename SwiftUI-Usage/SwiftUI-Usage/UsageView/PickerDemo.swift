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
    var body: some View {
        Form {
               Section {
                
                   Picker(selection: $selection, label:
                       Text("Picker Name")
                       , content: {
                           Text("Value 1").tag(0)
                           Text("Value 2").tag(1)
                           Text("Value 3").tag(2)
                           Text("Value 4").tag(3)
                   })
               }
           }
    }
}


#if DEBUG
struct PickerDemo_Preview: PreviewProvider {
    static var previews: PickerDemo {
        return PickerDemo()
    }
}
#endif
