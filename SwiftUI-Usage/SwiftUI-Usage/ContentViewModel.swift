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
                    ListModel(title: "TabView2", nextView: AnyView( TabViewDemo2() )),
                    ListModel(title: "Stpper", nextView: AnyView( StepperDemo() )),
                    ListModel(title: "Form", nextView: AnyView( FormDemo() )),
                    ListModel(title: "LifeCycle", nextView: AnyView( LifeCycleDemo() )),
                    ListModel(title: "Gesture", nextView: AnyView( GestureDemo() )),
                    ListModel(title: "Shape", nextView: AnyView( ShapeDemo() )),
                    ListModel(title: "PopOver", nextView: AnyView( PopOverDemo() )),
                    ListModel(title: "Menu", nextView: AnyView( MenuDemo() )),
                    ListModel(title: "LoadDataFromNetwork", nextView: AnyView( LoadDataFromNetworkDemo() )),
                    ListModel(title: "ImagePicker", nextView: AnyView( ImagePickerDemo() )),
                    ListModel(title: "SwiftUI-Lab_AnchorPreferences", nextView: AnyView( SwiftUILab_AnchorPreferences() )),
                    ListModel(title: "CoordinateSpace", nextView: AnyView( CoordinateSpace() )),
                    ListModel(title: "SnapCarousel", nextView: AnyView( SnapCarousel().environmentObject(UIStateModel()) )),
                    ListModel(title: "ToolBarItem(iOS14)", nextView: AnyView( ToolBarItemDemo() )),
                    ListModel(title: "UIKitInSwiftUIDemo", nextView: AnyView( UIKitInSwiftUIDemo() )),
                    ListModel(title: "ColorfulDemo", nextView: AnyView( ColorfulDemo() )),
                    ListModel(title: "SineWaveShapeDemo", nextView: AnyView( SineWaveShapeDemo() )),
                    ListModel(title: "ParallaxSwiftUIDemo", nextView: AnyView( ParallaxSwiftUIDemo() )),
                    ListModel(title: "ScrollViewReaderDemo", nextView: AnyView( ScrollViewReaderDemo() )),
                    ListModel(title: "Transaction", nextView: AnyView( TransactionAnimation() )),
                    ListModel(title: "IsContinuous", nextView: AnyView( IsContinuous() )),
                    ListModel(title: "BindingTransaction", nextView: AnyView( BindingTransaction() )),
                    ListModel(title: "TransitionDemo", nextView: AnyView( TransitionDemo() )),
                    ListModel(title: "CustomTransitionDemo", nextView: AnyView( CustomTransitionDemo() )),
                    ListModel(title: "OthersAnimation", nextView: AnyView( OthersAnimation() )),
                    ListModel(title: "PullToRefreshView", nextView: AnyView( PullToRefreshView() )),
                    ListModel(title: "ListGeometryReader", nextView: AnyView( ListGeometryReader() )),
                    ListModel(title: "TypingTextAnimationViewDemo", nextView: AnyView( TypingTextAnimationViewDemo() )),
                    ListModel(title: "TypingTextDemo", nextView: AnyView( TypingTextDemo() )),
                    ListModel(title: "AdvancedAnimations", nextView: AnyView( AdvancedAnimations() )),
                    ListModel(title: "NeumorphicButton", nextView: AnyView( NeumorphicButton() )),
                    ListModel(title: "EmbossedButton", nextView: AnyView( EmbossedButtonDemo() )),

    ]
}



struct ListModel: Identifiable {
    var id = UUID()
    var title: String
    var nextView: AnyView
}


