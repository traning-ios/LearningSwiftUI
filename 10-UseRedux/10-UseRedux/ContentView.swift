//
//  ContentView.swift
//  10-UseRedux
//
//  Created by Le Xuan Quynh on 2019/12/23.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import ReSwift

struct Appstate: StateType {
    var count: Int = 0
}

struct CounterActionIncrease: Action {}

struct CounterActionDecrease: Action {}


func counterReducer(action: Action, state: Appstate?) -> Appstate {
    var state = state ?? Appstate()
    switch action {
    case _ as CounterActionDecrease:
        state.count -= 1
        break
    case _ as CounterActionIncrease:
        state.count += 1
    default:
        break
    }

    return state
}

let mainStore = Store<Appstate>(
    reducer: counterReducer, state: nil
)

struct ContentView: View {
    @ObservedObject private var mstate = ObservableState(store: mainStore)

    var body: some View {
        VStack {
            Text(String(mstate.current.count))
            Button(action: {
                self.mstate.dispatch(CounterActionIncrease())
            }) {
                Text("Increase")
            }

            Button(action: {
                self.mstate.dispatch(CounterActionDecrease())
            }) {
                Text("Decrease")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
