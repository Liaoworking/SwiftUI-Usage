//
//  TextUsage.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/8/28.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI

struct TextView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            Spacer()
            
            Text("TextBaseUage\nText基本用法\nTextUsageeeeeee")
                .bold()
                .font(.body)
                .foregroundColor(.green)
                .frame(minWidth:0,maxWidth: 200)
                .lineLimit(3)
                .fixedSize(horizontal: true, vertical: true)
                .padding(EdgeInsets(top: 10,
                                leading: 0,
                                bottom: 10,
                                trailing: 10))
                .background(Color.yellow)
                .cornerRadius(4)
                .shadow(color: .red,
                        radius: 3,
                        x: 3,
                        y: 3)
                .multilineTextAlignment(.center)


            HStack{
                Text("Attributes").font(.callout).foregroundColor(.pink) +
                    Text("String")
            }
            // two different code order make your UI different.
            // 不同的UI实现的顺序会产生不同的UI效果
            Text("Different Order")
                .font(.largeTitle)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                .cornerRadius(2)
                .background(Color.green)
            
            Text("Different Order")
                .font(.largeTitle)
                .background(Color.green)
                .cornerRadius(2)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
            // TODO: Get width of text?
            Spacer()
        }
        
    }
    
    
}

#if DEBUG
struct TextView_Preview: PreviewProvider {
    static var previews: TextView {
        return TextView()
    }
}
#endif
