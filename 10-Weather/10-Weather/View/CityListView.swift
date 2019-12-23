//
//  CityListView.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct CityListView : View {

    @EnvironmentObject var cityStore: CityStore

    @State var isAddingCity: Bool = false
    @State private var isEditing: Bool = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Your Cities")) {
                    ForEach(cityStore.cities) { city in
                        CityRow(city: city)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .navigationBarTitle(Text("Weather"))
        }
    }

    private var addButton: some View {
        Button(action: {
            self.isAddingCity = true
            self.isEditing = false
        }) {
            Image(systemName: "plus.circle.fill")
                .font(.title)
        }
            .presentation(isAddingCity ? newCityView : nil)
    }

    private func delete(at offsets: IndexSet) {
        for index in offsets {
            cityStore.cities.remove(at: index)
        }
    }

    private func move(from source: IndexSet, to destination: Int) {
        var removeCities: [City] = []

        for index in source {
            removeCities.append(cityStore.cities[index])
            cityStore.cities.remove(at: index)
        }

        cityStore.cities.insert(contentsOf: removeCities, at: destination)
    }

    private var newCityView: Modal {
        Modal(NewCityView(isAddingCity: $isAddingCity).environmentObject(cityStore)) {
            self.isAddingCity = false
        }
    }

}
