//
//  PageView.swift
//  OnboardingScreen
//
//  Created by John K. on 30/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI

struct PageView: View {
    
    var page = Page.getAll.first!
    
    var body: some View {
            VStack{
                
                Image(page.image)
                VStack{
                    Text(page.heading).font(.title).bold().layoutPriority(1).multilineTextAlignment(.center)
                    Text(page.subSubheading)
                        .multilineTextAlignment(.center)
                }.padding()
            }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
