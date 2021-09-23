//
//  MenuDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2021/7/1.
//  Copyright © 2021 Run Liao. All rights reserved.
//

import SwiftUI

struct MenuDemo: View {
    @State private var sort: Int = 0

    var body: some View {
        
        VStack {
            Menu {
                Section {
                    Button(action: {}) {
                        Label("Create a file", systemImage: "doc")
                    }

                    Button(action: {}) {
                        Label("Create a folder", systemImage: "folder")
                    }
                }

                Section(header: Text("Secondary actions")) {
                    Button(action: {}) {
                        Label("Remove old files", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            label: {
                Label("Add", systemImage: "plus")
            }
            
                    Menu {
                        Picker(selection: $sort, label: Text("Sorting options")) {
                            Text("Size").tag(0)
                            Text("Date").tag(1)
                            Text("Location").tag(2)
                        }
                    }
                    label: {
                        Label("", systemImage: "arrow.up.arrow.down")
                    }
            
            
        }
        

    }
    
    
}

struct MenuDemo_Previews: PreviewProvider {
    static var previews: some View {
        MenuDemo()
    }
}
