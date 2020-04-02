//
//  SizePreferences.swift
//  25-AnchorSample
//
//  Created by Le Xuan Quynh on 2020/03/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct SizePreferences<Item: Hashable>: PreferenceKey {
    typealias Value = [Item: CGSize]

    static var defaultValue: Value { [:] }

    static func reduce(
        value: inout Value,
        nextValue: () -> Value
    ) {
        value.merge(nextValue()) { $1 }
    }
}
