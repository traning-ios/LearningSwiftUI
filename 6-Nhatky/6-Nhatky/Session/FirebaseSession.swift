//
//  FirebaseSession.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseSession: ObservableObject {
    //MARK: Properties
    @Published var session: User?
    @Published var isLoggedIn: Bool?
    @Published var items: [Story] = []

    var databaseReference: DatabaseReference =  Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")

    func listen() {
        _ = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, email: user.email, displayName: user.displayName)
                self.isLoggedIn = true
                self.getAllStory()
            } else {
                self.isLoggedIn = false
                self.session = nil
            }
        })
    }

    //login
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.isLoggedIn = false
        self.session = nil
    }

    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }

    //get all story
    func getAllStory() {
        databaseReference.observe(DataEventType.value) { (snapshot) in
            self.items = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let story = Story(snapshot: snapshot) {
                    self.items.append(story)
                }
            }
        }
    }

    func createStory(story: Story) {
        //Generates number going up as time goes on, sets order of Story's by how old they are.
        let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
        let postRef = databaseReference.child(String(number))
        postRef.setValue(story.toAnyObject())
    }

    func updateStory() {
        print("need implement")
    }
}
