//
//  SigninView.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct SigninView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var firebaseSession: FirebaseSession

    var body: some View {
            VStack(spacing: 20) {
                Text("Enter your email and password")
                TextField("Email", text: $email).keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                Button(action: self.signIn) {
                    Text("Signin")
                }
                Text("--- OR ---")
                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                }
                
        }
    }

    func signIn() {
        firebaseSession.signIn(email: email, password: password) { (result, error) in
            if error != nil {
                print("Error when login: \(error?.localizedDescription ?? "")")
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
