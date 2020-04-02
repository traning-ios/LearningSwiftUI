//
//  BasicView.swift
//  25-AnchorSample
//
//  Created by Le Xuan Quynh on 2020/03/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct BasicView: View {
    var body: some View {
        ZStack {
            Color.yellow
            Text("Hello World !!!")
                .anchorPreference(
                    key: BoundsPreferenceKey.self,
                    value: .bounds
                ) { $0 }
        }
        .overlayPreferenceValue(BoundsPreferenceKey.self) { preferences in
            GeometryReader { geometry in
                preferences.map {
                    Rectangle()
                        .stroke()
                        .frame(
                            width: geometry[$0].width,
                            height: geometry[$0].height
                        )
                        .offset(
                            x: geometry[$0].minX,
                            y: geometry[$0].minY
                        )
                }
            }
        }
    }
}

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
        BasicView()
    }
}
