//
//  ContentView.swift
//  11-Redux SwiftUI Sample
//
//  Created by Le Xuan Quynh on 2019/12/25.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct RepoRow: View {
    let repo: Repo

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(repo.name)
                    .font(.headline)
                Text(repo.description ?? "")
                    .font(.subheadline)
            }
        }
    }
}

struct SearchView: View {
    @Binding var query: String
    let repos: [Repo]
    let onCommit: () -> Void

    var body: some View {
        NavigationView {
            List {
                TextField("Type something", text: $query, onCommit: onCommit)

                if repos.isEmpty {
                    Text("Loading...")
                } else {
                    ForEach(repos) { repo in
                        RepoRow(repo: repo)
                    }
                }
            }.navigationBarTitle(Text("Search"))
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState, AppAction>
    @State private var query: String = ""

    var body: some View {
        SearchView(
            query: $query,
            repos: store.state.searchResult,
            onCommit: fetch
        ).onAppear(perform: fetch)
    }

    private func fetch() {
        store.send(search(query: query))
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
