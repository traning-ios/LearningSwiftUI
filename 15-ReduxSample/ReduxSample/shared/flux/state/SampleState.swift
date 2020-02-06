//
//  SampleState.swift
//  ReduxSample
//
//  Created by Le Xuan Quynh on 2020/02/06.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation
import SwiftUIFlux

struct SampleState: FluxState, Codable {
    var number: Int = 0
}
