//
//  GithubService.swift
//  11-Redux SwiftUI Sample
//
//  Created by Le Xuan Quynh on 2019/12/25.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation
import Combine

class GithubService {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    func searchPublisher(matching query: String) -> AnyPublisher<[Repo], Error> {
        guard
            var urlComponents = URLComponents(string: "https://api.github.com/search/repositories")
            else { preconditionFailure("Can't create url components...") }

        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]

        guard
            let url = urlComponents.url
            else { preconditionFailure("Can't create url from url components...") }

        return session
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: SearchResponse.self, decoder: decoder)
            .map { $0.items }
            .eraseToAnyPublisher()
    }
}
