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
    
    let modelArray = [ListModel(id: 0,title: "UILabel -> Text", nextView: AnyView( TextDemo() )),
                    ListModel(id: 1, title: "UIImage -> Image", nextView: AnyView( ImageDemo() )),
                    ListModel(id: 2, title: "UIbutton -> Button", nextView: AnyView( ButtonDemo() )),
                    ListModel(id: 3, title: "UITextField -> TextField", nextView: AnyView( TextFieldDemo() )),
                    ListModel(id: 4, title: "UITableView -> List", nextView: AnyView( ListDemo() )),
                    ListModel(id: 5, title: "UISlider -> Slider", nextView: AnyView( SliderDemo().environmentObject(SliderData()) )),
                    ListModel(id: 6, title: "UISwitch -> Toggle", nextView: AnyView( ToggleDemo() )),
                    ListModel(id: 11, title: "UIPickerView -> Picker", nextView: AnyView( PickerDemo() )),                    
                    ListModel(id: 7, title: "UIAlertController -> ActionSheet & Alert", nextView: AnyView( ActionSheetDemo() )),
                    ListModel(id: 8, title: "UINavigationController -> NavigationView", nextView: AnyView( NavigationViewDemo() )),
                    ListModel(id: 9, title: "UITabBarViewController -> TabView", nextView: AnyView( TabViewDemo() )),
                    ListModel(id: 10, title: "Stpper", nextView: AnyView( StepperDemo() )),
                    ListModel(id: 12, title: "Form", nextView: AnyView( FormDemo() )),
                    ListModel(id: 13, title: "LifeCycle", nextView: AnyView( LifeCycleDemo() )),
                    ListModel(id: 14, title: "Gesture", nextView: AnyView( GestureDemo() )),
                    ListModel(id: 15, title: "Shape", nextView: AnyView( ShapeDemo() )),
                    ListModel(id: 16, title: "LoadDataFromNetwork", nextView: AnyView( LoadDataFromNetworkDemo() ))]
}

struct ListModel: Identifiable {
    var id: Int
    var title: String
    var nextView: AnyView
    
}

