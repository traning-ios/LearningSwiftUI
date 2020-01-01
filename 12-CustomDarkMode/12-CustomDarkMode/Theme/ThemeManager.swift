//
//  ThemeManager.swift
//  12-CustomDarkMode
//
//  Created by Le Xuan Quynh on 2019/12/26.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import UIKit
import SwiftUI

final class ThemeManager: ObservableObject {
    private static var sharedThemeManager: ThemeManager = ThemeManager()
    private init() {}
    class func shared() -> ThemeManager {
        return sharedThemeManager
    }

    static func applyTheme(theme: Theme) {
        print("applyTheme = \(theme)")
        userDefaults.updateObject(for: userDefaults.selectedTheme, with: theme.rawValue)
    }

    static func currentTheme() -> Theme {
        if let storedTheme = userDefaults.currentIntObjectState(for: userDefaults.selectedTheme) {
            print("currentTheme = \(storedTheme)")
            return Theme(rawValue: storedTheme) ?? .Default
        } else {
            return .Default
        }
    }

    
    var generalBackgroundColor: UIColor {
        switch ThemeManager.currentTheme() {
        case .Default:
            return UIColor.white
        case .Dark:
            return .black
        }
    }

    var generalTitleColor: UIColor {
        switch ThemeManager.currentTheme() {
        case .Default:
            return UIColor.black
        case .Dark:
            return UIColor.white
        }
    }

    var generalSubtitleColor: UIColor {
        switch ThemeManager.currentTheme() {
        case .Default:
            return UIColor(red:0.67, green:0.67, blue:0.67, alpha:1.0)
        case .Dark:
            return UIColor(red:0.67, green:0.67, blue:0.67, alpha:1.0)
        }
    }

    var generalPlaceHolder: UIColor {
        switch ThemeManager.currentTheme() {
        case .Default:
            return UIColor.gray
        case .Dark:
            return .lightGray
        }
    }

    enum Theme: Int {
        case Default, Dark
    }
}



