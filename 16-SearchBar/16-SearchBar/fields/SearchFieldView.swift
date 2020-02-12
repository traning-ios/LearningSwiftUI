//
//  SearchFieldView.swift
//  16-SearchBar
//
//  Created by Le Xuan Quynh on 2020/02/12.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import Combine

struct SearchFieldView: View {
    @ObservedObject var searchTextWrapper: SearchTextObservable
    let placeholder: String
    @Binding var isSearching: Bool
    var dismissButtonTitle: String
    var dismissButtonCallback: (() -> Void)?

    private var searchCancellable: Cancellable? = nil

    public init(searchTextWrapper: SearchTextObservable,
         placeholder: String,
         isSearching: Binding<Bool>,
         dismissButtonTitle: String = "Cancel",
         dismissButtonCallback: (() -> Void)? = nil) {
        self.searchTextWrapper = searchTextWrapper
        self.placeholder = placeholder
        self._isSearching = isSearching
        self.dismissButtonTitle = dismissButtonTitle
        self.dismissButtonCallback = dismissButtonCallback

        self.searchCancellable = searchTextWrapper.searchSubject.sink(receiveValue: { value in
            isSearching.wrappedValue = !value.isEmpty
        })
    }

    public var body: some View {
        GeometryReader { reader in
            HStack(alignment: .center, spacing: 0) {
                Image(systemName: "magnifyingglass")
                TextField(self.placeholder,
                          text: self.$searchTextWrapper.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                if !self.searchTextWrapper.searchText.isEmpty {
                    Button(action: {
                        self.searchTextWrapper.searchText = ""
                        self.isSearching = false
                        self.dismissButtonCallback?()
                    }, label: {
                        Text(self.dismissButtonTitle).foregroundColor(.pink)
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    .animation(.easeInOut)
                }
            }
            .preference(key: OffsetTopPreferenceKey.self,
                        value: reader.frame(in: .global).minY)
            .padding(4)
        }
    }
}

struct SearchFieldView_Previews: PreviewProvider {
    static var previews: some View {
        let withText = SearchTextObservable()
        withText.searchText = "loving"

        return VStack {
            SearchFieldView(searchTextWrapper: SearchTextObservable(),
                        placeholder: "Search anything 1",
                        isSearching: .constant(false))
            SearchFieldView(searchTextWrapper: withText,
                        placeholder: "Search anything 2",
                        isSearching: .constant(false))

            List {
                SearchFieldView(searchTextWrapper: withText,
                            placeholder: "Search anything 3",
                            isSearching: .constant(false))
                Section(header: SearchFieldView(searchTextWrapper: withText,
                                            placeholder: "Search anything 4",
                                            isSearching: .constant(false)))
                {
                    SearchFieldView(searchTextWrapper: withText,
                                placeholder: "Search anything 5",
                                isSearching: .constant(false))
                }
            }

            List {
                SearchFieldView(searchTextWrapper: withText,
                            placeholder: "Search anything 6",
                            isSearching: .constant(false))
                Section(header: SearchFieldView(searchTextWrapper: withText,
                                            placeholder: "Search anything 7",
                                            isSearching: .constant(false)))
                {
                    SearchFieldView(searchTextWrapper: withText,
                                placeholder: "Search anything 8",
                                isSearching: .constant(false))
                }
            }.listStyle(GroupedListStyle())
        }
    }
}
