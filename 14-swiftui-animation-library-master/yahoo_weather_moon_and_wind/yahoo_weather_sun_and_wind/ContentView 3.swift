//
//  ContentView.swift
//  yahoo_weather_sun_and_wind
//
//  Created by Amos Gyamfi on 29.7.2019.
//  Copyright © 2019 Amos Gyamfi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var sunMotion  = false
    @State var drawSunPath = false
    @State var rotateLargeFan = false
    @State var rotateSmallFan = false
    
    var body: some View {
        ZStack {
            Divider()
            Divider()
                .rotationEffect(.degrees(90))
                .offset(x: -200)
            
            Circle()
                .frame(width: 10)
                .foregroundColor(.yellow)
                .offset(x: -200 + 25)
            
            Circle()
                .frame(width: 10)
                .foregroundColor(.yellow)
                .offset(x: 175)
            
            // Motion Path Background
            Circle()
                .trim(from: 1/2, to: 1)
                .stroke()
                .frame(width: 350)
                .foregroundColor(.black)
                .offset(x: 0)
                .opacity(2/10)
            
            // Motion Path
            ZStack {
                Circle()
                    .trim(from: drawSunPath ? 1/2 : 1 , to: 1)
                    .stroke(Color.yellow, lineWidth: 3)
                    .frame(width: 350)
                    
                    // Use 2D & 3D rotation to flip path drawing
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 90, y: 0, z: 0))
                    .offset(x: 0)
                    .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false).delay(1))
                    .onAppear() {
                        self.drawSunPath.toggle()
                                    }
                Image(systemName: "sun.max")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                    .offset(x: -175) // Put offset above rotation in order to move it along the circular motion path
                    
                    .rotationEffect(.degrees(sunMotion ? 180 : 0))
                    .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false).delay(1))
                    
                    .onAppear() {
                        self.sunMotion.toggle()
                }
                
                Image(systemName: "moon.circle")
                    .font(.largeTitle)
                    .rotationEffect(.degrees(220))
                    .opacity(1/2)
                    .offset(x: 110, y: -200)
                    
                
                Text("Sun & Wind")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .offset(x: -110, y: -250)
                    Text("Wind 9,7 km/h SW")
                        .font(.headline)
                    .offset(y: -130)
                Text("04:40")
                    .offset(x: -176, y: 30)
                Text("22:12")
                    .offset(x: 176, y: 30)
                
            }
            
            // Fan Large
            Image("stand_l")
                .offset(x: -100, y: -40)
                .opacity(1/2)
            Image("fan_l")
                .opacity(1/2)
                .rotationEffect(.degrees(rotateLargeFan ? 360*4 : 0))
                .offset(x: -100, y: -80)
                .animation(Animation.easeInOut(duration: 4*4).repeatForever(autoreverses: false))
                .onAppear() {
                    self.rotateLargeFan.toggle()
                                }
            // Fan Small
            Image("stand_s")
                .offset(x: -60, y: -20)
                .opacity(1/2)
            Image("fan_s")
                .rotationEffect(.degrees(rotateSmallFan ? 360*4 : 0))
                .offset(x: -60, y: -40)
                .animation(Animation.easeInOut(duration: 4*4).repeatForever(autoreverses: false))
                .opacity(1/2)
                .onAppear() {
                    self.rotateSmallFan.toggle()
                                                }
            
            
            
        }
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
