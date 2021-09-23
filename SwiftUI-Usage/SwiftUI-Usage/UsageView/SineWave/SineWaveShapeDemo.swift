//
//  SineWaveShapeDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2021/9/23.
//  Copyright © 2021 Run Liao. All rights reserved.
//

import SwiftUI

struct SineWaveShapeDemo: View {
    var body: some View {
//        https://github.com/MrChens/SineWaveShape
        SineWaveShape(percent: 0.4, strength: 30, frequency: 7, phase: 0)
            .fill(Color.red)
                                .offset(y: CGFloat(1) * 2)
                                .animation(
                                    Animation.linear(duration: 0.5).repeatForever(autoreverses: false)
                                )
    }
}

struct SineWaveShapeDemo_Previews: PreviewProvider {
    static var previews: some View {
        SineWaveShapeDemo()
    }
}
