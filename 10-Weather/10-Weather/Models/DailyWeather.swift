//
//  DailyWeather.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation

struct DailyWeather: Codable, Identifiable {

    var id: Date {
        return time
    }

    var time: Date
    var maxTemperature: Double
    var minTemperature: Double
    var icon: Weather.Icon

    enum CodingKeys: String, CodingKey {

        case time = "time"
        case maxTemperature = "temperatureHigh"
        case minTemperature = "temperatureLow"
        case icon = "icon"

    }

}
