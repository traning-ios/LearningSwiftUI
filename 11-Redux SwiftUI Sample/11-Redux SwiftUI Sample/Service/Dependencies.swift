//
//  Dependencies.swift
//  11-Redux SwiftUI Sample
//
//  Created by Le Xuan Quynh on 2019/12/25.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation

struct Environment {
    var searchRepos = GithubService().searchPublisher
}

var Current = Environment()
