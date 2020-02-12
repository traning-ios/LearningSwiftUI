//
//  OffsetTopPreferenceKey.swift
//  16-SearchBar
//
//  Created by Le Xuan Quynh on 2020/02/12.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

public struct OffsetTopPreferenceKey: PreferenceKey {
    static public var defaultValue: CGFloat = 0
    public typealias Value = CGFloat

    static public func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
