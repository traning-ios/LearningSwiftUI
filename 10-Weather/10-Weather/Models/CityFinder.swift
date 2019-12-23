//
//  CityFinder.swift
//  10-Weather
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

class CityFinder: NSObject, BindableObject {

    var didChange = PassthroughSubject<CityFinder, Never>()

    var results: [String] = [] {
        didSet {
            didChange.send(self)
        }
    }

    private var searcher: MKLocalSearchCompleter

    override init() {
        results = []
        searcher = MKLocalSearchCompleter()
        super.init()
        searcher.resultTypes = .address
        searcher.delegate = self
    }

    func search(_ text: String) {
        searcher.queryFragment = text
    }

}

extension CityFinder: MKLocalSearchCompleterDelegate {

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        results = completer.results.map({ $0.title })
    }

}
