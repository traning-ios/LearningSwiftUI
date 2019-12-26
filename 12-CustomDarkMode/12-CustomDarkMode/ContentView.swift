//
//  ContentView.swift
//  12-CustomDarkMode
//
//  Created by Le Xuan Quynh on 2019/12/26.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

final class SelectionStore: ObservableObject {
    @Published var isDarkMode: Bool = ThemeManager.currentTheme() == .Default ? false : true {
        didSet {
            changeTheme(isDarkMode: isDarkMode)
        }
    }

    private func changeTheme(isDarkMode: Bool) {
        if isDarkMode {
            let theme = ThemeManager.Theme.Dark
            ThemeManager.applyTheme(theme: theme)
        } else {
            let theme = ThemeManager.Theme.Default
            ThemeManager.applyTheme(theme: theme)
        }
    }
}

struct ContentView: View {
    @State var text: String = ""
    @ObservedObject var store = SelectionStore()

    var body: some View {
        ZStack {
            Color(ThemeManager.shared().generalBackgroundColor)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 100) {
                Text("My text")
                    .foregroundColor(Color(ThemeManager.shared().generalTitleColor))
                CustomTextField(
                    placeholder: Text("Enter you text here..").foregroundColor(Color(ThemeManager.shared().generalPlaceHolder)),
                    text: $text
                )
                Toggle(isOn: $store.isDarkMode) {
                    if store.isDarkMode {
                        Text("Change DarkMode theme").foregroundColor(Color(ThemeManager.shared().generalTitleColor))
                    } else {
                        Text("Change Default theme").foregroundColor(Color(ThemeManager.shared().generalTitleColor))
                    }
                }

            }.padding(20)

        }
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit).foregroundColor(Color(ThemeManager.shared().generalTitleColor))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
