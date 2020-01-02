//
//  ContentView.swift
//  yahoo_weather_sun_and_wind
//
//  Created by Amos Gyamfi on 29.7.2019.
//  Copyright © 2019 Amos Gyamfi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Divider()
            Divider()
                .rotationEffect(.degrees(90))
                .offset(x: -200)
            
            Circle()
                .frame(width: 10)
                .foregroundColor(.yellow)
                .offset(x: -200 + 20)
            
            Circle()
                .frame(width: 10)
                .foregroundColor(.yellow)
                .offset(x: 180)
            
            // Motion Path Background
            Circle()
                .trim(from: 1/2, to: 1)
                .stroke()
                .frame(width: 350)
                .foregroundColor(.black)
                .offset(x: 0)
                .opacity(1/2)
            
            // Motion Path
            Circle()
                .trim(from: 1/2, to: 1)
                .stroke()
                .frame(width: 350)
                .foregroundColor(.yellow)
                .offset(x: 0)
            
            // Fan Large
            Image("stand_l")
                .offset(x: -100, y: -40)
                .opacity(1/2)
            Image("fan_l")
                .offset(x: -100, y: -80)
                .opacity(1/2)
            
            
            // Fan Small
            Image("stand_s")
                .offset(x: -60, y: -20)
                .opacity(1/2)
            Image("fan_s")
                .offset(x: -60, y: -40)
                .opacity(1/2)
        
            
            
            
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
