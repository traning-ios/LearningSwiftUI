//
//  ContentView.swift
//  7-Navigation
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       NavigationView {
          NavigationLink(destination: SecondView()) {
             Text("Press on me")
          }.buttonStyle(PlainButtonStyle())
       }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
