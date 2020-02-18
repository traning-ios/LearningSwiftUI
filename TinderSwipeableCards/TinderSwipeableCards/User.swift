//
//  User.swift
//  TinderSwipeableCards
//
//  Created by Le Xuan Quynh on 2020/02/18.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Hashable, CustomStringConvertible {
    var id: Int

    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String

    var description: String {
        return "\(firstName), id: \(id)"
    }
}
