//
//  UserDefaultsManager.swift
//  12-CustomDarkMode
//
//  Created by Le Xuan Quynh on 2019/12/26.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation

let userDefaults = UserDefaultsManager()

class UserDefaultsManager: NSObject {

    fileprivate let defaults = UserDefaults.standard
    let selectedTheme = "SelectedTheme"
    
    //updating
    func updateObject(for key: String, with data: Any?) {
        defaults.set(data, forKey: key)
        defaults.synchronize()
    }

    func currentIntObjectState(for key: String) -> Int? {
        return defaults.integer(forKey: key)
    }
}
