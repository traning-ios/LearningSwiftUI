//
//  PageViewController.swift
//  2-ManhinhChao
//
//  Created by Le Xuan Quynh on 2019/12/18.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    var viewControllers: [UIViewController]

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return pageViewController
    }

    func updateUIViewController(_ uiViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PageViewController>) {
        [viewControllers[0]], direction: .forward, animated: true)
    }
}

struct PageViewController_Previews: PreviewProvider {
    static var previews: some View {
        PageViewController()
    }
}
