//
//  SignupView.swift
//  6-Nhatky
//
//  Created by Le Xuan Quynh on 2019/12/20.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var firebaseSession: FirebaseSession

    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("Email")
                    TextField("Enter Email Address", text: $email).keyboardType(.emailAddress)
                }
                .padding()
 
                HStack {
                    Text("Password")
                    SecureField("Enter Password", text: $password)
                }
                .padding()

                Button(action: signUp) {
                    Text("Sign Up")
                }
            }
        }
        .padding()

    }

    func signUp() {

        if !email.isEmpty && !password.isEmpty {
            firebaseSession.signUp(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error when signup: \(error?.localizedDescription ?? "")")
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
