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
            Text("Different Orders")
                .font(.largeTitle)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                .cornerRadius(2)
                .background(Color.green)
            
            Text("Different Orders")
                .font(.largeTitle)
                .background(Color.green)
                .cornerRadius(2)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
          
            Text("Dash Border")
                 .fontWeight(.bold)
                 .font(.title)
                 .foregroundColor(.purple)
                 .padding()
                 .overlay(
                     Capsule(style: .continuous)
                         .stroke(Color.purple, style: StrokeStyle(lineWidth: 5, dash: [10]))
                 )
            // TODO: Get width of text?
            
            VStack(){
                Text("下面的Label的长度以我为准")
                GeometryReader() { geometry in
                    Text("不瞒你说，我的长度以上面的长度为准").frame(width: 10, alignment: .center)
                }
            }
            
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
