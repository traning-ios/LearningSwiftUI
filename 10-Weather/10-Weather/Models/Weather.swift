//
//  Weather.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation
import SwiftUI

struct Weather: Codable {
    var current: HourlyWeather
    var hours: Weather.List<HourlyWeather>
    var week: Weather.List<DailyWeather>

    enum CodingKeys: String, CodingKey {

        case current = "currently"
        case hours = "hourly"
        case week = "daily"

    }
}

extension Weather {

    struct List<T: Codable & Identifiable>: Codable {

        var list: [T]

        enum CodingKeys: String, CodingKey {

            case list = "data"

        }

    }

}

extension Weather {

    enum Icon: String, Codable {

        case clearDay = "clear-day"
        case clearNight = "clear-night"
        case rain = "rain"
        case snow = "snow"
        case sleet = "sleet"
        case wind = "wind"
        case fog = "fog"
        case cloudy = "cloudy"
        case partyCloudyDay = "partly-cloudy-day"
        case partyCloudyNight = "partly-cloudy-night"

        var image: Image {
            switch self {
            case .clearDay:
                return Image(systemName: "sun.max.fill")
            case .clearNight:
                return Image(systemName: "moon.stars.fill")
            case .rain:
                return Image(systemName: "cloud.rain.fill")
            case .snow:
                return Image(systemName: "snow")
            case .sleet:
                return Image(systemName: "cloud.sleet.fill")
            case .wind:
                return Image(systemName: "wind")
            case .fog:
                return Image(systemName: "cloud.fog.fill")
            case .cloudy:
                return Image(systemName: "cloud.fill")
            case .partyCloudyDay:
                return Image(systemName: "cloud.sun.fill")
            case .partyCloudyNight:
                return Image(systemName: "cloud.moon.fill")
            }
        }

    }

}
