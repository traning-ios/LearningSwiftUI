//
//  NewCityView.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation
import SwiftUI

struct NewCityView : View {

    @Binding var isAddingCity: Bool
    @State private var search: String = ""

    @ObjectBinding var cityFinder: CityFinder = CityFinder()
    @EnvironmentObject var cityStore: CityStore

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField($search, placeholder: Text("Search City")) {
                        self.cityFinder.search(self.search)
                    }
                }

                Section {
                    ForEach(cityFinder.results.identified(by: \.self)) { result in
                        Button(action: {
                            self.addCity(from: result)
                            self.isAddingCity = false
                        }) {
                            Text(result)
                        }
                            .foregroundColor(.black)
                    }
                }
            }
                .navigationBarTitle(Text("Add City"))
                .navigationBarItems(leading: cancelButton)
                .listStyle(.grouped)
        }
    }

    private var cancelButton: some View {
        Button(action: {
            self.isAddingCity = false
        }) {
            Text("Cancel")
        }
    }

    private func addCity(from result: String) {
        let cityName = result.split(separator: ",").first ?? ""
        let city = City(name: String(cityName))
        cityStore.cities.append(city)
    }

}
