//
//  HourlyWeather.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation

struct HourlyWeather: Codable, Identifiable {

    var id: Date {
        return time
    }

    var time: Date
    var temperature: Double
    var icon: Weather.Icon

}
