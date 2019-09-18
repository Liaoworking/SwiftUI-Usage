//
//  GetDataFromNetworkDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/15.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
struct LoadDataFromNetworkDemo: View {
    
    @ObservedObject var viewModel: LoadDataViewModel = LoadDataViewModel()
    
    var body: some View {
        VStack(spacing:10) {
            Text("\(viewModel.todoModel.title ?? "")")
            Text("⬆️This Data will download from the Internet after 2 sceonds")
                .multilineTextAlignment(.center)
                .foregroundColor(.purple)
                .lineLimit(2)
        }.padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.viewModel.fetchUserInfo()
            }
        }.navigationBarTitle("LoadDataFromNetwork")
    }
}
