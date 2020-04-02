//
//  CenterView.swift
//  26-DrawerSample
//
//  Created by Le Xuan Quynh on 2020/04/02.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct CenterView: View {
    @Environment(\.sideMenuLeftPanelKey) var sideMenuLeftPanel
    @Environment(\.sideMenuRightPanelKey) var sideMenuRightPanel
    var body: some View {
        NavigationView {
            Text("CenterView  sc")
        }
    .navigationBarTitle("Xin chao")
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView()
    }
}
