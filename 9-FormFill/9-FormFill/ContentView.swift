//
//  ContentView.swift
//  9-FormFill
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""

    var body: some View {
        NavigationView {
            List {
                Image("quynh")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                VStack() {
                    LabelTextField(label: "Name", placeHolder: "Enter your name", value: name)
                    LabelTextField(label: "Name", placeHolder: "Enter your name", value: name)
                    LabelTextField(label: "Name", placeHolder: "Enter your name", value: name)
                }.padding(.top, 20)
                    .listRowInsets(EdgeInsets())

                RoundedButton().padding(.top, 20)
            }
        }
        .navigationBarTitle("Fill text in here")
        .navigationBarItems(trailing: Button(action: {
            print("You touched navigation bar")
        }, label: {
            Text("Cancel")
        }))
    }
}

struct LabelTextField : View {
    var label: String
    var placeHolder: String
    @State var value: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label).font(.headline)
            TextField(placeHolder, text: $value).padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
                .cornerRadius(5)
        }.padding(.horizontal, 15)

    }
}


struct RoundedButton : View {
    var body: some View {
        Button(action: self.touchedButton) {
            HStack {
                Spacer()
                Text("Save")
                    .font(.headline)
                    .colorMultiply(.white)
                Spacer()
            }
        }
        .padding(.vertical, 10.0)
        .background(Color.red).cornerRadius(4.0)
        .padding(.horizontal, 50)
    }

    fileprivate func touchedButton() {
        print("you touched me!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
