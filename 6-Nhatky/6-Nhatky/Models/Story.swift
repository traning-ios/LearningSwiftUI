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
    let time: String
    let isOwner: Bool
    
    init(title: String, content: String, isOwner: Bool, isVisible: String = "true", key: String = "") {
        self.databaseReference = nil
        self.id = key
        self.key = key
        self.title = title
        self.content = content
        self.isVisible = isVisible
        self.isOwner = isOwner
        
        let dateString = Date().iso8601

        if let date = dateString.iso8601 {
            self.time = date.iso8601
            print(date.iso8601)
        } else {
            self.time = ""
        }
    }

    init?(snapshot: DataSnapshot, isCrush: Bool = false) {
        guard
        let value = snapshot.value as? [String: AnyObject],
        let title = value["title"] as? String,
        let content = value["content"] as? String,
        let isVisible = value["isVisible"] as? String,
        let time = value["time"] as? String,
        let isOwner = value["isOwner"] as? Bool
        else {
            return nil
        }

        self.databaseReference = snapshot.ref
        self.key = snapshot.key
        self.title = title
        self.content = content
        self.isVisible = isVisible
        self.id = snapshot.key
        self.time = time
        if isCrush {
            self.isOwner = false
        } else {
            self.isOwner = isOwner
        }
        
    }

    func toAnyObject() -> Any {
        return [
            "title": title,
            "content": content,
            "isVisible": isVisible,
            "isOwner": isOwner,
            "time": time
        ]
    }
}
