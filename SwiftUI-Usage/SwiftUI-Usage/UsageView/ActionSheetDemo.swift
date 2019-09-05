//
//  ActionSheetDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/5.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI
import Combine

struct ActionSheetDemo: View {
    @State private var showSheet = false
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button(action: {
                self.showSheet.toggle()
            }) {
                Text("Show ActionSheet")
            }.actionSheet(isPresented: $showSheet,
                          content: { () -> ActionSheet in
                            ActionSheet(title: Text("Titie"),
                                        message: Text("message"),
                                        buttons: [.default(Text("first default"),
                                                        action: { print("first clicked") }),
                                                  .default(Text("second default"),
                                                        action: { print("second clicked") }),
                                                  .destructive(Text("destructive"),
                                                        action: { print("destructive clicked") }),
                                                  .cancel(Text("cancel"),
                                                        action: { print("action clicked") })
                                                ])
              })
            
            Button(action: {
                self.showAlert.toggle()
            }) {
                // What's the button looks like here
                Text("Show Alert").foregroundColor(Color.green)
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Title"),
                      message: Text("message"),
                      primaryButton: .default(Text("Default"),
                                              action: { print("Default Clicked") }),
                      secondaryButton: .destructive(Text("Cancel"),
                                                    action: { print("Cancle Clicked")})
                )
            }
        }
    }
    
}


#if DEBUG
struct ActionSheetDemo_Preview: PreviewProvider {
    static var previews: ActionSheetDemo {
        return ActionSheetDemo()
    }
}
#endif
