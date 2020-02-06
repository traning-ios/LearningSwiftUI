//
//  ContentView.swift
//  Feeling_Fireworks
//
//  Created by Amos Gyamfi on 30.12.2019.
//  Copyright © 2019 Amos Gyamfi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var biggestSplash = false
    @State var showStroke = false
    @State var showFireworks = false
    @State var bigRotates = false
    @State var biggerAnimates = false
    @State var smallTrims = false
    let screenColor = Color(red: 0.0, green: 0.0, blue: 0.0)
    var body: some View {
        ZStack {
            screenColor
                .scaleEffect(1.2)
            Text("Feeling Fireworks")
                .font(.title)
                .foregroundColor(.gray)
                .offset(y: -350)
            ZStack {
                Circle() // Biggest
                    .strokeBorder(style: StrokeStyle(lineWidth: biggestSplash ? 1 : 50, lineCap: .butt, miterLimit: 1, dash: [1, 20], dashPhase: 1))
                    .frame(width: 350, height: 350)
                    .foregroundColor(.blue)
                    .animation(Animation.easeInOut(duration: 1).speed(1).delay(0.5).repeatForever(autoreverses: false))
                                      .onAppear() {
                                          self.biggestSplash.toggle()
                                  }
                Circle() // Bigger
                    .strokeBorder(style: StrokeStyle(lineWidth: biggerAnimates ? 1 : 20, lineCap: .butt, miterLimit: 1, dash: [1, 20], dashPhase: 1))
                    .frame(width: 250, height: 250)
                    .foregroundColor(.white)
                    .animation(Animation.easeInOut(duration: 1).speed(1).delay(0.5).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.biggerAnimates.toggle()
                }
                
                Circle() // Big
                    .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, miterLimit: 1, dash: [120, 120], dashPhase: 1))
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(bigRotates ? 360*2 : 0))
                    .animation(Animation.easeInOut(duration: 1).speed(1).delay(0.5).repeatForever(autoreverses: false))
                        .onAppear() {
                            self.bigRotates.toggle()
                    }
                
                Circle() // Small
                    .trim(from: smallTrims ? 0 : 1/9, to: smallTrims ? 1/9 : 1)
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 1).speed(1).delay(0.5).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.smallTrims.toggle()
                }
                
                Circle() // Smaller
                    .strokeBorder(style: StrokeStyle(lineWidth: showStroke ? 1 : 30))
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    //.shadow(color: .white, radius: 60, x: -1, y: -10)
                    .animation(Animation.easeInOut(duration: 1).speed(1).delay(0.5).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.showStroke.toggle()
                }
            
            } // Fireworks
                .scaleEffect(showFireworks ? 10 : 0, anchor: .bottomTrailing)
                .shadow(color: showFireworks ? .red : .pink, radius: showFireworks ? -1 : 1, x: 20, y: 20)
                .rotation3DEffect(.degrees(70), axis: (x: -0.1, y: -0.5, z: 0))
                .animation(Animation.easeInOut(duration: 1).speed(1).delay(1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.showFireworks.toggle()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
