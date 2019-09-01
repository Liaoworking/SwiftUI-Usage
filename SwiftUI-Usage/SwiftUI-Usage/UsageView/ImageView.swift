//
//  ImageView.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/1.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        ScrollView {
            VStack {
                // system image
                       Image(systemName: "book")
                       Text("systemImage SF Symbols")
                       
                       Image("logo")
                       Text("Image")
                       
                       Image(uiImage: UIImage(named: "logo")!)
                       Text("UIImage")
                       
                       // U mast call resizable before frame
                       Image("logo")
                           .resizable()
                           .frame(width: 86, height: 86)
                       Text("Image 86 * 86")

                       Image("logo")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 86, height: 100)
                          .background(Color.red)
                       Text("Image scaledToFit")
            }
            
            VStack {
                Image("logo")
                   .resizable()
                   .scaledToFill()
                   .frame(width: 86, height: 100)
                   .clipped()
                Text("scaledToFill and clip")
                }
            
        }
    }
}


#if DEBUG
struct ImageView_Preview: PreviewProvider {
    static var previews: ImageView {
        return ImageView()
    }
}
#endif
