//
//  ButtonView.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/1.
//  Copyright © 2019 Run Liao. All rights reserved.
//


import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("do some thing here")
            }) {
                // What's the button looks like here
                Text("Button")
            }
            
            Button(action: {
                   print("read It1")
               }) {
                   VStack {
                       Image(systemName: "book")
                           .font(.title)
                       Text("read it")
                           .fontWeight(.semibold)
                           .font(.title)
                    }
                    .frame(width: 140, height: 80)
                   .foregroundColor(.white)
                   .background(Color.red)
                   .cornerRadius(40)
                }
            
            Button(action: {
                   print("read It2")
               }) {
                   VStack {
                       Image(systemName: "book")
                           .font(.title)
                       Text("read it")
                           .fontWeight(.semibold)
                           .font(.title)
                    }
                    .frame(width: 140, height: 80)
                   .foregroundColor(.white)
                   .background(
                    LinearGradient(gradient:
                        Gradient(colors: [Color.yellow,
                            Color.green]),
                            startPoint: .leading,
                            endPoint: .trailing)
                   )
                   .cornerRadius(40)
                }
            
            Button(action: {
                              print("read It2")
              }) {
                  HStack {
                      Image(systemName: "book")
                          .font(.title)
                      Text("read it")
                          .fontWeight(.semibold)
                          .font(.title)
                  }.padding([.top,.bottom], 5)
                  .frame(minWidth: 0, maxWidth: .infinity)
                  .foregroundColor(.white)
                  .background(
                   LinearGradient(gradient:
                       Gradient(colors: [Color.yellow,
                           Color.green]),
                           startPoint: .leading,
                           endPoint: .trailing)
                  )
                .cornerRadius(20)
                    .padding([.leading,.trailing])
               }
        }
    }
}


#if DEBUG
struct ButtonView_Preview: PreviewProvider {
    static var previews: ButtonView {
        return ButtonView()
    }
}
#endif
