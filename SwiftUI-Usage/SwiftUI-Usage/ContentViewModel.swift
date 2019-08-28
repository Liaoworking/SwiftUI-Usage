//
//  ContentViewModel.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/8/28.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
struct ContentViewModel {
    let modelArray: [ListModel] = [ListModel(title: "UILabel -> Text", nextView: AnyView( TextView() ))]
}

struct ListModel: Identifiable {
    var id: UUID?
    var title: String
    var nextView: AnyView
    
}

