//
//  ShapeDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/11.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI
import Combine

struct ShapeDemo: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Capsule")
                .frame(maxWidth: 100, maxHeight: 20)
                .background(Color.yellow)
                .clipShape(Capsule())
            
            Text("Circle")
                .frame(maxWidth: 100, maxHeight: 20)
                .background(Color.yellow)
                .clipShape(Circle())
            Text("Ellipse")
                .frame(maxWidth: 100, maxHeight: 20)
                .background(Color.yellow)
                .clipShape(Ellipse())
            
            Text("Rectangle")
                .frame(maxWidth: 100, maxHeight: 20)
                .background(Color.yellow)
                .clipShape(Rectangle())
            
            Text("RoundedRectangle")
                .frame(maxWidth: 150, maxHeight: 20)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 3))
            
            VStack {
                Image("jay").resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .background(Color.red)
                    .clipShape(CustomShape())
                Text("CustomShape ↑")
            }
        }
        .navigationBarTitle("shape")
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        // idea is from here :https://swiftui-lab.com/swiftui-animations-part1/
        
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        var points: [CGPoint] = []
        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()
        for i in 0..<5 {
            let angle = (Double(i) * (360.0 / Double(5))) * Double.pi / 180
            print(angle)

             // Calculate vertex position
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            print(pt)
            points.append(pt)
        }
        points.enumerated().forEach { (idx, point) in
            if idx == 0 {
                path.move(to: points[0])
                path.addLine(to: points[3])
            } else {
                path.addLine(to: points[idx])
                if idx == 1 {
                    path.addLine(to: points[idx + 3])
                } else {
                    path.addLine(to: points[idx - 2])
                }
            }
        }
        path.closeSubpath()
        return path
    }
}


#if DEBUG
struct ShapeDemo_Preview: PreviewProvider {
    static var previews: ShapeDemo {
        return ShapeDemo()
    }
}
#endif
