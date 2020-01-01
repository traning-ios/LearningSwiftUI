//
//  Repo.swift
//  11-Redux SwiftUI Sample
//
//  Created by Le Xuan Quynh on 2019/12/25.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct Repo: Decodable, Identifiable {
    var id: Int
    let owner: Owner
    let name: String
    let description: String?

    struct Owner: Decodable {
        let avatar: URL

        enum CodingKeys: String, CodingKey {
            case avatar = "avatar_url"
        }
    }
}

struct SearchResponse: Decodable {
    let items: [Repo]
}
