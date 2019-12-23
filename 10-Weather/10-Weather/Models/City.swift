//
//  City.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import Combine

class City: ObservedObject {

    var didChange = PassthroughSubject<City, Never>()

    let name: String
    var weather: Weather? {
        didSet {
            didChange.send(self)
        }
    }

    init(name: String) {
        self.name = name
        self.getWeather()
    }

    private func getWeather() {
        guard let url = URL(string: WeatherManager.baseURL + "45.572353,5.915807?units=ca&lang=fr") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970

                let weatherObject = try decoder.decode(Weather.self, from: data)

                DispatchQueue.main.async {
                    self.weather = weatherObject
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

}

