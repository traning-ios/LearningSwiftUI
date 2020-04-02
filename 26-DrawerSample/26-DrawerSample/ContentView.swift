//
//  ContentView.swift
//  26-DrawerSample
//
//  Created by Le Xuan Quynh on 2020/04/02.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import SideMenu

struct ContentView: View {
    var body: some View {
        SideMenu(leftMenu: LeftMenu(),
             centerView: CenterView())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
