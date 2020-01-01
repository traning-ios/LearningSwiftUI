//
//  NewStoryView.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct NewStoryView: View {
    @State private var title = ""
    @State private var content = ""
    @ObservedObject var firebaseSession = FirebaseSession()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Enter title", text: $title)
            TextField("Enter content", text: $content)
            Button(action: {
                self.addNewStory()
            }) {
                Text("Add new")
            }
        }

    }

    func addNewStory() {
        if !title.isEmpty && !content.isEmpty {
            //Create new story to Firebase
            let story = Story(title: title, content: content, isOwner: true)
            firebaseSession.createStory(story: story)
            dismiss()
        }
        
    }

    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewStoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewStoryView()
    }
}
