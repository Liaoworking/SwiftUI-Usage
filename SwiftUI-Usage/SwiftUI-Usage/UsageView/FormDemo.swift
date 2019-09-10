//
//  FormDemo.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/11.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import SwiftUI
import Combine

struct FormDemo: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        Form {
            Section(header: Text("User Info")) {
                TextField("UserName", text: $name)
                TextField("Email", text: $email)
            }
            Section(header: Text("Password")) {
                SecureField("Password", text: $password)
            }
            Section {
                Button(action: {
                            print("tapped OK")
                        }) {
                            Text("Save")
                        }
            }
        }
    }
}


#if DEBUG
struct FormDemo_Preview: PreviewProvider {
    static var previews: FormDemo {
        return FormDemo()
    }
}
#endif
