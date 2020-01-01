//
//  Public.swift
//  12-CustomDarkMode
//
//  Created by Le Xuan Quynh on 2019/12/26.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import UIKit

extension UITableViewCell {
  var selectionColor: UIColor {
    set {
      let view = UIView()
      view.backgroundColor = newValue

      self.selectedBackgroundView = view
    }
    get {
      return self.selectedBackgroundView?.backgroundColor ?? UIColor.clear
    }
  }
}
