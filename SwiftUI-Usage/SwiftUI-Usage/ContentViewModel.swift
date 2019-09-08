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
    
    @State var needPopBack = false
    
    let modelArray = [ListModel(id: 0,title: "UILabel -> Text", nextView: AnyView( TextView() )),
                    ListModel(id: 1, title: "UIImage -> Image", nextView: AnyView( ImageView() )),
                    ListModel(id: 2, title: "UIbutton -> Button", nextView: AnyView( ButtonView() )),
                    ListModel(id: 3, title: "UITextField -> TextField", nextView: AnyView( TextFieldDemo() )),
                    ListModel(id: 4, title: "UITableView -> List", nextView: AnyView( ListDemo() )),
                    ListModel(id: 5, title: "UISlider -> Slider", nextView: AnyView( SliderDemo().environmentObject(SliderData()) )),
                    ListModel(id: 6, title: "UIAlertController -> ActionSheet & Alert", nextView: AnyView( ActionSheetDemo() )),
                    ListModel(id: 7, title: "UINavigationController -> NavigationView", nextView: AnyView( NavigationViewDemo() )),
                    ListModel(id: 8, title: "UIAlertController -> ActionSheet & Alert", nextView: AnyView( ActionSheetDemo() ))]
}

struct ListModel: Identifiable {
    var id: Int
    var title: String
    var nextView: AnyView
    
}

