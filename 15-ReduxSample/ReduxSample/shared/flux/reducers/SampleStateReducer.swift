//
//  SampleStateReducer.swift
//  ReduxSample
//
//  Created by Le Xuan Quynh on 2020/02/06.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation
import SwiftUIFlux

func sampleStateReducer(state: SampleState, action: Action) -> SampleState {
    var state = state
    switch action {
    case let action as SampleAction.SetSampleAction:
        state.number = action.response.results[0].number
        break
    default:
        break
    }

    return state
}

