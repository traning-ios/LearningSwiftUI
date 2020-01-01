//
//  ContentView.swift
//  3-StateSwiftUI
//
//  Created by Le Xuan Quynh on 2019/12/18.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var pokemonName = "Charmander"

    var body: some View {
        VStack {
            Text(pokemonName).frame(
              width: UIScreen.main.bounds.width,
              height: 50
            )
            .background(Color.blue)
            .foregroundColor(Color.white)
            .padding(10)
            Button(action: {  self.switchPokemon()},
                   label: {Text("Switch")})
        }
    }

    func switchPokemon() {
      let list = ["Squirtle", "Bulbasaur", "Charmander", "Pikachu"]
      pokemonName = list.randomElement() ?? ""
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
