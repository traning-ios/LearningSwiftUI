//
//  SystemServices.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct SystemServices: ViewModifier {
    static var firebaseSession = FirebaseSession()
    
    func body(content: Content) -> some View {
        content
            // services
            .environmentObject(Self.firebaseSession)
    }
}
