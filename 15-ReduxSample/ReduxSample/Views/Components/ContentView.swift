//
//  ContentView.swift
//  ReduxSample
//
//  Created by Le Xuan Quynh on 2020/02/06.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct ContentView: ConnectedView {
    // MARK: - Vars
    @EnvironmentObject private var store: Store<AppState>

    struct Props {
        let number: Int
    }

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(number: state.sampleState.number)
    }

    func body(props: Props) -> some View {
        Group {
            VStack {
                Text(String(props.number))

                Button(action: {
                    self.store.dispatch(action: SampleAction.FetchSampleAction())
                }) {
                    Text("Increase data")
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
