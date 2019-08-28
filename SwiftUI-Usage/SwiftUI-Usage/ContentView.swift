//
//  ContentView.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/8/28.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    let viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            
            List(viewModel.modelArray){ model in
                NavigationLink(destination: model.nextView) {
                    Text(model.title)
                }                
            }.navigationBarTitle(Text("Demo")
                , displayMode: .inline)
            
        }


    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
