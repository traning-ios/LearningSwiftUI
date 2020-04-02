//
//  SideMenuConfig.swift
//  27-sideMenuWithoutPakage
//
//  Created by Le Xuan Quynh on 2020/04/02.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

public struct SideMenuConfig {
    public var menuBGColor: Color
    public var menuBGOpacity: Double
    
    public var menuWidth: CGFloat
    
    public var animationDuration: Double
    
    
    public init(menuBGColor: Color = .black, menuBGOpacity: Double = 0.3,
                menuWidth: CGFloat = 300, animationDuration: Double = 0.3) {
        self.menuBGColor = menuBGColor
        self.menuBGOpacity = menuBGOpacity
        self.menuWidth = menuWidth
        self.animationDuration = animationDuration
    }
}
