//
//  ContentView.swift
//  28-CustomDarkLightMode
//
//  Created by Le Xuan Quynh on 2020/04/02.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            Text("Hello, World!")
            .foregroundColor(.backgroundColor)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.colorScheme, .dark)
    }
}

extension Color {    
    static let backgroundColor = Color("BackgroundColor")
}
