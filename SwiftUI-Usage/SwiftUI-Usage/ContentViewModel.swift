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
    
    let modelArray = [ListModel(title: "UILabel -> Text", nextView: AnyView( TextDemo() )),
                    ListModel(title: "UIImage -> Image", nextView: AnyView( ImageDemo() )),
                    ListModel(title: "UIbutton -> Button", nextView: AnyView( ButtonDemo() )),
                    ListModel(title: "UITextField -> TextField", nextView: AnyView( TextFieldDemo() )),
                    ListModel(title: "UITableView -> List", nextView: AnyView( ListDemo() )),
                    ListModel(title: "UISlider -> Slider", nextView: AnyView( SliderDemo().environmentObject(SliderData()) )),
                    ListModel(title: "UISwitch -> Toggle", nextView: AnyView( ToggleDemo() )),
                    ListModel(title: "UIPickerView -> Picker", nextView: AnyView( PickerDemo() )),
                    ListModel(title: "UIAlertController -> ActionSheet & Alert", nextView: AnyView( ActionSheetDemo() )),
                    ListModel(title: "UINavigationController -> NavigationView", nextView: AnyView( NavigationViewDemo() )),
                    ListModel(title: "UITabBarViewController -> TabView", nextView: AnyView( TabViewDemo() )),
                    ListModel(title: "Stpper", nextView: AnyView( StepperDemo() )),
                    ListModel(title: "Form", nextView: AnyView( FormDemo() )),
                    ListModel(title: "LifeCycle", nextView: AnyView( LifeCycleDemo() )),
                    ListModel(title: "Gesture", nextView: AnyView( GestureDemo() )),
                    ListModel(title: "Shape", nextView: AnyView( ShapeDemo() )),
                    ListModel(title: "LoadDataFromNetwork", nextView: AnyView( LoadDataFromNetworkDemo() )),
                    ListModel(title: "ImagePicker", nextView: AnyView( ImagePickerDemo() )),
                    ListModel(title: "SwiftUI-Lab_AnchorPreferences", nextView: AnyView( SwiftUILab_AnchorPreferences() )),
                    ListModel(title: "CoordinateSpace", nextView: AnyView( CoordinateSpace() )),
                    ListModel(title: "SnapCarousel", nextView: AnyView( SnapCarousel().environmentObject(UIStateModel()) )),
                    ListModel(title: "ToolBarItem(iOS14)", nextView: AnyView( ToolBarItemDemo() )),

    ]
}



struct ListModel: Identifiable {
    var id = UUID()
    var title: String
    var nextView: AnyView
}


