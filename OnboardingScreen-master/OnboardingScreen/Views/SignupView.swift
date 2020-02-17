//
//  SignupView.swift
//  OnboardingScreen
//
//  Created by John K on 05/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI

struct SignupView: View {
       
    @State private var email = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    
    @State private var formOffset: CGFloat = 0
    
    var body: some View {
        
       return VStack(spacing: 40) {
            Image("Logo")
            Text("Sign Up").font(.title).bold()
            VStack {
                LCTextfield(value: self.$email, placeholder: "Email", icon: Image(systemName: "at"), onEditingChanged: { flag in
                    withAnimation {
                        self.formOffset = flag ? -150 : 0
                    }
                    
                })
                LCTextfield(value: self.$password, placeholder: "Password", icon: Image(systemName: "lock"), isSecure: true)
                LCTextfield(value: self.$confirmedPassword, placeholder: "Confirm Password", icon: Image(systemName: "lock.rotation"), isSecure: true)
                LCButton(text: "Sign up") {
                    
                }
            }
            
            Button(action: {
            }) {
              HStack {
                Text("Already have an account?").accentColor(Color.accentColor)
                  }
              }
            
       }.padding().offset(y: self.formOffset)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
