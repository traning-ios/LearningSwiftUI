//
//  ContentView.swift
//  17-PassThroughSubjectSample
//
//  Created by Le Xuan Quynh on 2020/02/12.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    var presenter = Presenter()
    /*SwiftUI manages the storage of any property you declare as a state. When the state value changes, the view invalidates its appearance and recomputes the body. Use the state as the single source of truth for a given view.*/
    @State private var stringToDisplay:String?
    var body: some View {
       let vStack = VStack {
                 Text(stringToDisplay ?? "Empty")
                 Button(action: {
                    self.presenter.changeData()
                         }) {
                            Text("Refresh Data")
         }
        }
        /*onReceive - Adds an action to the view to perform when the given publisher emits an event.*/
        return vStack.onReceive(presenter.didChange) { (outPut) in
        print(outPut)
            self.stringToDisplay = nil
            self.stringToDisplay = outPut
        }
 }
}
struct Presenter {
    /*A subject that broadcasts elements to downstream subscribers.*/
      var didChange = PassthroughSubject<String,Never>()

      func changeData(){
        didChange.send("Hola")
      }
}
