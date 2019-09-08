//
//  StepperDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/8.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI


struct StepperDemo: View {
    @State var quantity: Int = 0

    @State var score: Int = 0
    
    var body: some View {
        VStack(spacing:10) {
            Stepper(value: $quantity, in: 0...10, label: { Text("Quantity \(quantity)")})
            
            Stepper("Score: \(score)", value: $score, in: 0...100, step: 1) { (isEditingChanged) in
                print("isEditingChanged\(isEditingChanged)")
            }
        }.padding()
    }
}


#if DEBUG
struct StepperDemo_Preview: PreviewProvider {
    static var previews: StepperDemo {
        return StepperDemo()
    }
}
#endif
