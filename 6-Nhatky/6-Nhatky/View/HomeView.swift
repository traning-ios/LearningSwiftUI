//
//  HomeView.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    //MARK: Properties
   @EnvironmentObject var firebaseSession: FirebaseSession

    var body: some View {
        VStack {
            NavigationLink(destination: NewStoryView()) {
                Text("Add new story")
            }

            List {
                ForEach(self.firebaseSession.items) { story  in
                    NavigationLink(destination: DetailStoryView()) {
                        StoryRowView(story: story)
                    }
                }
            }.navigationBarItems(trailing: Button(action: {
                self.firebaseSession.signOut()
            }, label: {
                Text("Signout")
            }))
        }.onAppear(perform: getStory)
    }

    //MARK: Functions
    func getStory() {
        firebaseSession.listen()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
