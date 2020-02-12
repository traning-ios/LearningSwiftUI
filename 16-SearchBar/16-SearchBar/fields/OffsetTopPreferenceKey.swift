//
//  OffsetTopPreferenceKey.swift
//  16-SearchBar
//
//  Created by Le Xuan Quynh on 2020/02/12.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct OffsetTopPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    typealias Value = CGFloat

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
