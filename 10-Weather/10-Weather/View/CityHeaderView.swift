//
//  CityHeaderView.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct CityHeaderView: View {

    @ObjectBinding var city: City

    var temperature: String {
        guard let temperature = city.weather?.current.temperature else {
            return "-ºC"
        }
        return temperature.formattedTemperature
    }

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                city.weather?.current.icon.image
                    .font(.largeTitle)
                Text(temperature)
                    .font(.largeTitle)
            }
            Spacer()
        }
            .frame(height: 110)
    }

}
