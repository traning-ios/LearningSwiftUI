//
//  LeftMenu.swift
//  27-sideMenuWithoutPakage
//
//  Created by Le Xuan Quynh on 2020/04/02.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct LeftMenu: View {
    var body: some View {
        return GeometryReader { geometry in
            VStack(spacing: 10) {
                Text("LeftMenu")
            }
        }
        .background(Color.blue)
        .background(Rectangle().shadow(radius: 4))
    }
}

struct LeftMenu_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenu()
    }
}
