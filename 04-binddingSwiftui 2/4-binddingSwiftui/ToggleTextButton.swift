//
//  ToggleTextButton.swift
//  4-binddingSwiftui
//
//  Created by Le Xuan Quynh on 2019/12/18.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct ToggleTextButton: View {
    @Binding var isOn: Bool

    var body: some View {
        Button(
          action: { self.isOn.toggle() },
          label: { Text(self.isOn ? "Hide" : "Show") }
        )
    }
}

#if DEBUG
struct ToggleTextButton_Previews: PreviewProvider {
    @State static var myCoolBool = true // Note: it must be static

    static var previews: some View {
        ToggleTextButton(isOn: $myCoolBool)
    }
}
#endif
