//
//  App.swift
//  11-Redux SwiftUI Sample
//
//  Created by Le Xuan Quynh on 2019/12/25.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation
import Combine

func search(query: String) -> AnyPublisher<AppAction, Never> {
    Current.searchRepos(query)
        .replaceError(with: [])
        .map { AppAction.setSearchResults(repos: $0) }
        .eraseToAnyPublisher()
}

enum AppAction {
    case setSearchResults(repos: [Repo])
}

struct AppState {
    var searchResult: [Repo] = []
}

func appReducer(state: inout AppState, action: AppAction) {
    switch action {
    case let .setSearchResults(repos):
        state.searchResult = repos
    }
}

