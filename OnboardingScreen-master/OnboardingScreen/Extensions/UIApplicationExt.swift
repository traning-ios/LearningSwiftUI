//
//  UIApplicationExt.swift
//  OnboardingScreen
//
//  Created by John K on 18/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
