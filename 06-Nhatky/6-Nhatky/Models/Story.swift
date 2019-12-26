//
//  Story.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Story: Identifiable {
    let id: String
    let databaseReference: DatabaseReference?
    let title: String
    let content: String
    let isVisible: String
    let key: String

    init(title: String, content: String, isVisible: String = "true", key: String = "") {
        self.databaseReference = nil
        self.id = key
        self.key = key
        self.title = title
        self.content = content
        self.isVisible = isVisible
    }

    init?(snapshot: DataSnapshot) {
        guard
        let value = snapshot.value as? [String: AnyObject],
        let title = value["title"] as? String,
        let content = value["content"] as? String,
        let isVisible = value["isVisible"] as? String
        else {
            return nil
        }

        self.databaseReference = snapshot.ref
        self.key = snapshot.key
        self.title = title
        self.content = content
        self.isVisible = isVisible
        self.id = snapshot.key
    }

    func toAnyObject() -> Any {
        return [
            "title": title,
            "content": content,
            "isVisible": isVisible
        ]
    }
}
