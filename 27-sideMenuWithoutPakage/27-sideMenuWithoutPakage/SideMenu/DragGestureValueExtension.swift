//
//  DragGestureValueExtension.swift
//  27-sideMenuWithoutPakage
//
//  Created by Le Xuan Quynh on 2020/04/02.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

enum DragDirection {
    case left
    case right
    case up
    case down
}

extension DragGesture.Value {

    var dragDirection: DragDirection {
        if startLocation.x > location.x {
            return DragDirection.left
        } else if startLocation.x < location.x {
            return DragDirection.right
        } else if startLocation.y < location.y {
            return DragDirection.up
        } else {
            return DragDirection.down
        }
    }
    
}

