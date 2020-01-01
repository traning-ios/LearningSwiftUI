//
//  Appview.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct Appview: View {
    //MARK: Properties
    @ObservedObject var firebaseSession = FirebaseSession()
    
    var body: some View {
        NavigationView {
            Group {
                if firebaseSession.session != nil {
                    HomeView()
                } else {
                    SigninView()
                        .navigationBarItems(trailing: Text(""))
                }
            }.onAppear(perform: getUser)
                .navigationBarTitle(Text("My story"))
                .padding()
        }
    }
    
    //MARK: Functions
    func getUser() {
        firebaseSession.listen()
    }
}

struct Appview_Previews: PreviewProvider {
    static var previews: some View {
        Appview()
    }
}
