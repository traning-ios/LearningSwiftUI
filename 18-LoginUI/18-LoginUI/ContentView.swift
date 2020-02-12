//
//  ContentView.swift
//  18-LoginUI
//
//  Created by Le Xuan Quynh on 2020/02/12.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""

    var body: some View {
        Form {
            Section(footer: Text("Hello, World!").foregroundColor(.red)) {
                TextField("Username", text: $username)
                .autocapitalization(.none)
            }

            Section(footer: Text("Hello, World!").foregroundColor(.red)) {
                SecureField("Password", text: $username)
                SecureField("Password again", text: $username)
            }

            Section {
              Button(action: {  }) {
                Text("Sign up")
              }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
