//
//  ListDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/4.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI

struct ListDemo: View {

    private var dataList: [ListDemoModel] = [ListDemoModel(id: 1,
                                                  sectionName: "Section1",
                                                  systemImageName: "faceid",
                                                  content: "Face ID"),
                                    ListDemoModel(id: 2,
                                                  sectionName: "Section2",
                                                  systemImageName: "wifi",
                                                  content: "Wifi")]
    
    var body: some View {
        VStack(){
            List(){
                ForEach(dataList) { model in
                    Section(header: Text(model.sectionName),footer: HStack{
                        Image(systemName: "bottom")
                        Text("Footer")
                    }) {
                        Row(imageName: model.systemImageName, content: model.content)
                        }
                }
            }.listStyle(GroupedListStyle())
        }
        
    }
}

struct Row: View {
    
    var imageName: String
    var content: String

    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 10, content: {
                Image(systemName: imageName)
                Text(content)
            })
        }
    }
}

struct ListDemoModel: Identifiable {
    var id: Int
    var sectionName: String
    var systemImageName: String
    var content: String
}

#if DEBUG
struct ListDemo_Preview: PreviewProvider {
    static var previews: ListDemo {
        return ListDemo()
    }
}
#endif
