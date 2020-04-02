//
//  AdvanceView.swift
//  25-AnchorSample
//
//  Created by Le Xuan Quynh on 2020/03/23.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

struct AdvanceView: View {
     @State private var cards: [String] = [
           "Lorem", "ipsum", "is", "placeholder", "text", "!!!"
       ]

    
       var body: some View {
           Grid(cards) { card in
               Text(card)
                   .frame(width: 120, height: 120)
                   .background(Color.orange)
                   .cornerRadius(8)
                   .padding(4)
           }
       }
}

struct AdvanceView_Previews: PreviewProvider {
    static var previews: some View {
        AdvanceView()
    }
}
