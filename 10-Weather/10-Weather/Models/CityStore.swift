//
//  CityStore.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import Combine

class CityStore: ObservedObject {

    let didChange = PassthroughSubject<CityStore, Never>()

    var cities: [City] = [City(name: "Chambery")] {
        didSet {
            didChange.send(self)
        }
    }

}
