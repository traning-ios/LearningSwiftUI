//
//  PageControl.swift
//  2-ManhinhChao
//
//  Created by Le Xuan Quynh on 2019/12/18.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI

import Foundation
import UIKit
import SwiftUI

struct PageControl: UIViewRepresentable {

    var numberOfPages: Int

    @Binding var currentPageIndex: Int

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = UIColor.orange
        control.pageIndicatorTintColor = UIColor.gray

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }

}

