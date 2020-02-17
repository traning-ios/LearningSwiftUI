//
//  ContentView.swift
//  Tabbar-SwiftUI
//
//  Created by Mert Ala on 9.10.2019.
//  Copyright © 2019 Mert Ala. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
    
      
        TabView {
         
            Text("TabBar SwiftUI")
          
                .tabItem {
                    Image(systemName: "house")
                    Text("home")
                }
            
            Text("SwiftUI Setting")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }
    }
}


