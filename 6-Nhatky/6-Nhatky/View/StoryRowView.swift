//
//  StoryRowView.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct StoryRowView: View {
    var story: Story

    var body: some View {
        VStack {
            Text(story.title)
            Text(story.content)
        }

    }
}
