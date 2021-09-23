//
//  ColorfulDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2021/9/23.
//  Copyright © 2021 Run Liao. All rights reserved.
//

import SwiftUI

struct ColorfulDemo: View {
    var body: some View {
        //https://github.com/Co2333/Colorful
        ColorfulView(animated: true, animation: Animation
                        .interpolatingSpring(stiffness: 50, damping: 1)
                        .speed(0.05), blurRadius: 39, colorCount: 30)
    }
}

struct ColorfulDemo_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulDemo()
    }
}
