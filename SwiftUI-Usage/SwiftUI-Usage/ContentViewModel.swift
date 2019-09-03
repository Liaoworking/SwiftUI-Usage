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
    let modelArray = [ListModel(id: 0,title: "UILabel -> Text", nextView: AnyView( TextView() )),
                    ListModel(id: 1, title: "UIImage -> Image", nextView: AnyView( ImageView() )),
                    ListModel(id: 2, title: "UIbutton -> Button", nextView: AnyView( ButtonView() )),
                    ListModel(id: 3, title: "UITextField -> TextField", nextView: AnyView( TextFieldDemo() ))]
}

struct ListModel: Identifiable {
    var id: Int
    var title: String
    var nextView: AnyView
    
}

