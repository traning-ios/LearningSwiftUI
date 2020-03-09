//
//  LoginView.swift
//  24-CombineLoginProject
//
//  Created by Le Xuan Quynh on 2020/03/05.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var userViewModel = UserViewModel()

    var body: some View {
      Form {
        Section {
          TextField("Username", text: $userViewModel.username)
            .autocapitalization(.none)
          }
          Section {
            SecureField("Password", text: $userViewModel.password)
            SecureField("Password again", text: $userViewModel.passwordAgain)
         }
         Section {
           Button(action: { }) {
             Text("Sign up")
           }.disabled(true)
//            disabled(!$userViewModel.isValid)
         }
       }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
