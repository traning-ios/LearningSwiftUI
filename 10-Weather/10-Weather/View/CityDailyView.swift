//
//  CityDailyView.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct CityDailyView : View {

    @State var day: DailyWeather

    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Text(day.time.formattedDay)
                Spacer()
                HStack(spacing: 16) {
                    verticalTemperatureView(min: true)
                    verticalTemperatureView(min: false)
                }
            }
            HStack(alignment: .center) {
                Spacer()
                day.icon.image
                    .font(.body)
                Spacer()
            }
        }
    }

    func verticalTemperatureView(min: Bool) -> some View {
        VStack(alignment: .trailing) {
            Text(min ? "min" : "max")
                .font(.footnote)
                .color(.gray)
            Text(min ? day.minTemperature.formattedTemperature : day.maxTemperature.formattedTemperature)
                .font(.headline)
        }
    }

}
