//
//  AdvancedAnimationPart5.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2023/8/28.
//  Copyright © 2023 Run Liao. All rights reserved.
//

import SwiftUI

struct AdvancedAnimationPart5: View {
    var body: some View {
//        drawTextView
        drawThreeHouse
        drawThreeHouse2
        drawThreeHouse3
    }
    
    var drawTextView: some View {
        Canvas { context, size in
            var resolved = context.resolve(Text("Ni hao."))
            let textSize = resolved.measure(in: size)
            resolved.shading = .linearGradient(Gradient(colors: [.red,.yellow]), startPoint: CGPoint(x: (size.width - textSize.width) * 0.5, y: 0), endPoint: CGPoint(x: (size.width - textSize.width) * 0.5 + textSize.width, y: textSize.height))
            context.draw(resolved, in: CGRect(x: (size.width - textSize.width) * 0.5, y: 0, width: textSize.width, height: textSize.height))
        }
    }
    
    var drawThreeHouse: some View {
        Canvas { context, size in
            
            // All drawing is done at x4 the size
            context.scaleBy(x: 4, y: 4)

            let midpoint = CGPoint(x: size.width / (2 * 4), y: size.height / (2 * 4))
            
            var house = context.resolve(Image(systemName: "house.fill"))

            // Left house
            house.shading = .color(.red)
            context.draw(house, at: midpoint - CGPoint(x: house.size.width, y: 0), anchor: .center)

            // Right house
            house.shading = .color(.blue)
            context.draw(house, at: midpoint + CGPoint(x: house.size.width, y: 0), anchor: .center)
            
            // Center house 添加blur的filter
            context.addFilter(.blur(radius: 1.0, options: .dithersResult), options: .linearColor)
            house.shading = .color(.green)
            context.draw(house, at: midpoint, anchor: .center)

        }
    }
    
    /// 使用了context是值类型可以随意拷贝的特性画3个房子
    var drawThreeHouse2: some View {
        Canvas { context, size in
            
            // All drawing is done at x4 the size
            context.scaleBy(x: 4, y: 4)

            let midpoint = CGPoint(x: size.width / (2 * 4), y: size.height / (2 * 4))
            
            var house = context.resolve(Image(systemName: "house.fill"))

            // Left house
            house.shading = .color(.red)
            context.draw(house, at: midpoint - CGPoint(x: house.size.width, y: 0), anchor: .center)

            // Center house  把context 复制一份  这个blurContext用来做blur效果
            var blurContext = context
            
            blurContext.addFilter(.blur(radius: 1.0, options: .dithersResult), options: .linearColor)
            house.shading = .color(.green)
            blurContext.draw(house, at: midpoint, anchor: .center)

            // Right house
            house.shading = .color(.blue)
            // 原有的context不受影响
            context.draw(house, at: midpoint + CGPoint(x: house.size.width, y: 0), anchor: .center)

        }
    }

    // 使用layers来画三只小房子
    var drawThreeHouse3: some View {
        Canvas { context, size in
            
            // All drawing is done at x4 the size
            context.scaleBy(x: 4, y: 4)

            let midpoint = CGPoint(x: size.width / (2 * 4), y: size.height / (2 * 4))
            
            var house = context.resolve(Image(systemName: "house.fill"))

            // Left house
            house.shading = .color(.red)
            context.draw(house, at: midpoint - CGPoint(x: house.size.width, y: 0), anchor: .center)

            // Center house 使用闭包复制一份新的context 修改复制好的layerContext对原来的不会有影响
            context.drawLayer { layerContext in
                layerContext.addFilter(.blur(radius: 1.0, options: .dithersResult), options: .linearColor)
                house.shading = .color(.green)
                layerContext.draw(house, at: midpoint, anchor: .center)
            }
            
            // Right house
            house.shading = .color(.blue)
            context.draw(house, at: midpoint + CGPoint(x: house.size.width, y: 0), anchor: .center)

            
        }
    }
    
    var canvasWithCographic: some View {
        Canvas { context, size in
            context.withCGContext { cgContext in
                
            }
        }
    }
    
    
    
}

#Preview {
    AdvancedAnimationPart5()
}

extension CGPoint {
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}
