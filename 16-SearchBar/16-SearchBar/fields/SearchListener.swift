//
//  SearchListener.swift
//  16-SearchBar
//
//  Created by Le Xuan Quynh on 2020/02/12.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation

class SearchListener {
    var currentPage: Int = 1 {
        didSet {
            loadPage()
        }
    }

    func loadPage() {

    }
}

final class SearchPageListener: SearchListener {
    var text: String?

    override func loadPage() {
        if let text = text, !text.isEmpty {
            print("Searching action with \(text)")
        }
    }
}
