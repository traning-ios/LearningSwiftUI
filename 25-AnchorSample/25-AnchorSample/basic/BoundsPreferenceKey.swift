//
//  BoundsPreferenceKey.swift
//  25-AnchorSample
//
//  Created by Le Xuan Quynh on 2020/03/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct BoundsPreferenceKey: PreferenceKey {
    typealias Value = Anchor<CGRect>?

    static var defaultValue: Value = nil

    static func reduce(
        value: inout Value,
        nextValue: () -> Value
    ) {
        value = nextValue()
    }
}
