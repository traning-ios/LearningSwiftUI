//
//  SearchTextObservable.swift
//  16-SearchBar
//
//  Created by Le Xuan Quynh on 2020/02/12.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import Combine

class SearchTextObservable: ObservableObject {
    @Published public var searchText = "" {
        willSet {
            DispatchQueue.main.async {
                self.searchSubject.send(newValue)
            }
        }
        didSet {
            DispatchQueue.main.async {
                self.onUpdateText(text: self.searchText)
            }
        }
    }

    let searchSubject = PassthroughSubject<String, Never>()

    func onUpdateText(text: String) {
        /// Overwrite by your subclass to get instant text update.
//        print("onUpdateText \(text)")
    }

    func onUpdateTextDebounced(text: String) {
        /// Overwrite by your subclass to get debounced text update.
//        print("onUpdateTextDebounced \(text)")
    }

    deinit {
        searchCancellable?.cancel()
    }

    private var searchCancellable: Cancellable? {
        didSet {
            oldValue?.cancel()
        }
    }

    init() {
        searchCancellable = searchSubject.eraseToAnyPublisher()
            .map {
                $0
        }
        .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
        .removeDuplicates()
        .filter { !$0.isEmpty }
        .sink(receiveValue: { (searchText) in
            self.onUpdateTextDebounced(text: searchText)
        })
    }
}
