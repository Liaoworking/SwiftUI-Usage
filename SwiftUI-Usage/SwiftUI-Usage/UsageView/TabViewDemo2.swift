//
//  TabViewDemo2.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/9/15.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI

enum TabType: String, CaseIterable {
    case first
    case second
    case third
    case forth
    
}

struct TabViewDemo2: View {
    
    @StateObject private var tabStore = TabStore()
    
    var body: some View {
        TabView(selection: $tabStore.tabType,
                content:  {
            ForEach(TabType.allCases,id: \.self) { tabType in
                Text(tabType.rawValue)
            }
        })
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

    }
}


class TabStore: ObservableObject {
    @Published var tabType: TabType = .first {
        didSet {
            print("current:",tabType)
        }
    }
}

#if DEBUG
struct TabViewDemo2_Preview: PreviewProvider {
    static var previews: TabViewDemo2 {
        return TabViewDemo2()
    }
}
#endif
