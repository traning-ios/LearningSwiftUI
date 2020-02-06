//
//  ContentView.swift
//  Spin intersecting_circles
//
//  Created by Amos Gyamfi on 1.11.2019.
//  Copyright © 2019 Amos Gyamfi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var spin = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .scaleEffect(1.2)
            Image("intersecting_circles")
                .rotationEffect(.radians(spin ? .pi/2 : 0))
                .animation(Animation.linear.repeatForever(autoreverses: false).speed(1.0))
                .onAppear() {
                    self.spin.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
