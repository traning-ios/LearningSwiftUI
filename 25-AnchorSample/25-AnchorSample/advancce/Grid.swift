//
//  Grid.swift
//  25-AnchorSample
//
//  Created by Le Xuan Quynh on 2020/03/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct Grid<Data: RandomAccessCollection, ElementView: View>: View where Data.Element: Hashable {
    private let data: Data
    private let itemView: (Data.Element) -> ElementView

    @State private var preferences: [Data.Element: CGRect] = [:]

    init(_ data: Data, @ViewBuilder itemView: @escaping (Data.Element) -> ElementView) {
        self.data = data
        self.itemView = itemView
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ForEach(self.data, id: \.self) { item in
                    self.itemView(item)
                        .alignmentGuide(.leading) { _ in
                            -self.preferences[item, default: .zero].origin.x
                    }.alignmentGuide(.top) { _ in
                        -self.preferences[item, default: .zero].origin.y
                    }.anchorPreference(
                        key: SizePreferences<Data.Element>.self,
                        value: .bounds
                    ) {
                        [item: geometry[$0].size]
                    }
                }
            }
        }
    }
}
