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
//    static let kBaseStory = "nhatky-2f1c0"
    static let kUserStory = "user_story"
    static let kUserCodeName = "user_code"
    static let kCrushCodeName = "crush_code"
    
    //MARK: Properties
    @Published var session: User?
    @Published var isLoggedIn: Bool?
    var userStoryList: [Story] = []
    var crushStoryList: [Story] = []
    @Published var storyList: [Story] = []
    
    var userCode: UserCode?
    var crushCode: UserCode?
    var databaseReference: DatabaseReference?

    private func initDatabaseReference() {
        if databaseReference == nil  {
            let firebasePath = Auth.auth().currentUser?.uid ?? ""
            if firebasePath.count > 0 {
                databaseReference =  Database.database().reference(withPath: firebasePath)
            } else {
                #if DEBUG
                print("cannot create databaseReference")
                #endif
                return
            }
        }
    }
    
    init() {
        initDatabaseReference()
    }
    
    func listen() {
        _ = Auth.auth().addStateDidChangeListener({ [weak self](auth, user) in
            if let user = user {
                self?.session = User(uid: user.uid, email: user.email, displayName: user.displayName)
                self?.isLoggedIn = true
                self?.getUserStory()
                
                self?.getCrushCode { (hasFound, code) in
                    if let code = code {
                        self?.getCrushStory(firebasePath: code)
                    }
                }
                
            } else {
                self?.isLoggedIn = false
                self?.session = nil
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
        self.databaseReference = nil
        self.userCode = nil
    }

    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    //get user story
    func getUserStory() {
        initDatabaseReference()
        
        databaseReference!.child(FirebaseSession.kUserStory).observe(DataEventType.value) {(snapshot) in
            self.userStoryList = []
            //remove all user story
            let userList = self.storyList.filter { (story) -> Bool in
                return !story.isOwner
            }
            self.storyList = userList
            
            snapshot.children.forEach { (snapshot) in
                if let story = Story(snapshot: snapshot as! DataSnapshot) {
                    self.userStoryList.append(story)
                    self.storyList.append(story)
                }
            }
            
            self.storyList = self.storyList.sorted { (item1, item2) -> Bool in
                return item1.key > item2.key
            }
        }
    }

    func getCrushStory(firebasePath: String) {
        let databaseReference =  Database.database().reference(withPath: firebasePath)
        databaseReference.child(FirebaseSession.kUserStory).observe(DataEventType.value) { (snapshot) in
            self.crushStoryList = []
            //remove all crush story
            let userList = self.storyList.filter { (story) -> Bool in
                return story.isOwner
            }
            
            self.storyList = userList
            
            snapshot.children.forEach { (snapshot) in
                if let story = Story(snapshot: snapshot as! DataSnapshot, isCrush: true) {
                    self.crushStoryList.append(story)
                    self.storyList.append(story)
                }
            }
            
            self.storyList = self.storyList.sorted { (item1, item2) -> Bool in
                return item1.key > item2.key
            }
        }
    }
    
    func createStory(story: Story) {
        if let databaseReference = databaseReference {
            //Generates number going up as time goes on, sets order of Story's by how old they are.
            let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
            let postRef = databaseReference.child(FirebaseSession.kUserStory).child(String(number))
            postRef.setValue(story.toAnyObject())
        }
    }

    func updateStory() {
        print("need implement")
    }
    
    //MARK: create user code
    func getUserCode(completion: @escaping ((Bool)-> Void)) {
        if let databaseReference = databaseReference {
            databaseReference.child(FirebaseSession.kUserCodeName).observe(DataEventType.value) {[weak self] (snapshot) in
                if let code = UserCode(snapshot: snapshot) {
                    self?.userCode = code
                    completion(true)
                }
                
                if (self?.userCode == nil) {
                    completion(false)
                }
            }
        }
    }
    
    
    func createUserCode() {
        getUserCode(completion: { [weak self] hasFound in
            if !hasFound {
                if let databaseReference = self?.databaseReference {
                    let groupChild = FirebaseSession.kUserCodeName
                    let groupRef = databaseReference.child(groupChild)
                    let uid = Auth.auth().currentUser?.uid ?? ""
                    let userCode = UserCode(code: uid, isEnable: "true")
                    groupRef.setValue(userCode.toAnyObject())
                }
            }
        })
    }
        
    //MARK: create connect with my crush
    func getCrushCode(completion: @escaping ((Bool, String?)-> Void)) {
        if let databaseReference = databaseReference {
            databaseReference.child(FirebaseSession.kCrushCodeName).observe(DataEventType.value) { [weak self](snapshot) in
                if let code = UserCode(snapshot: snapshot) {
                    self?.crushCode = code
                    completion(true, code.code)
                }
                
                if (self?.crushCode == nil) {
                    completion(false, nil)
                }
            }
        }
    }        
    
    func connectCrushCode(crushCode: String) {
        getCrushCode {[weak self] (hasFound, code) in
            if !hasFound {
                if let databaseReference = self?.databaseReference {
                    let groupChild = FirebaseSession.kCrushCodeName
                    let groupRef = databaseReference.child(groupChild)
                    let userCode = UserCode(code: crushCode, isEnable: "true")
                    groupRef.setValue(userCode.toAnyObject())
                }
            }
        }
    }
}
