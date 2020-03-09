//
//  UserViewModel.swift
//  24-CombineLoginProject
//
//  Created by Le Xuan Quynh on 2020/03/05.
//  Copyright © 2020 Le Xuan Quynh. All rights reserved.
//

import Foundation

class UserViewModel: ObservableObject {
  // Input
  @Published var username = ""
  @Published var password = ""
  @Published var passwordAgain = ""

  // Output
  @Published var isValid = false
}
