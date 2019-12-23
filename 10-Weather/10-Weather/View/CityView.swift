//
//  CityView.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct CityView : View {

    @ObjectBinding var city = City(name: "Chambéry")

    var body: some View {
        List {
            Section(header: Text("Now")) {
                CityHeaderView(city: city)
            }

            Section(header: Text("Hourly")) {
                CityHourlyView(city: city)
            }

            Section(header: Text("This week")) {
                ForEach(city.weather?.week.list ?? []) { day in
                    CityDailyView(day: day)
                }
            }
        }
            .navigationBarTitle(Text(city.name))
    }

}
