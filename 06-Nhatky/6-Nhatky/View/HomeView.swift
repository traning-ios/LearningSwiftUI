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
            Button(action: {
                self.connectCrush(crushCode: "abc")
            }) {
                Text("Connect with crush")
            }
            
            List {
                ForEach(self.firebaseSession.storyList) { story  in
                    NavigationLink(destination: DetailStoryView(story: story)) {
                        StoryRowView(story: story)
                    }
                }
            }.navigationBarItems(trailing: Button(action: {
                self.firebaseSession.signOut()
            }, label: {
                Text("Signout")
            }))
        }.onAppear(perform: getAll)
    }

    //MARK: Functions
    
    func getAll() {
        getStory()
        createUserCode()
    }
    func getStory() {
        firebaseSession.listen()
    }
    
    private func createUserCode() {
        firebaseSession.createUserCode()
    }
    
    private func connectCrush(crushCode: String) {
//        firebaseSession.connectCrushCode(crushCode: "J4MOiolgHacUUYK9zcHadLbpkP43")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
