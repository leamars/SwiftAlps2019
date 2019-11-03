//
//  AppState.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 03/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AppState: ObservableObject {
  @Published var user: User
  @Published var selectedTab = 2
  
  init() {
    self.user = UserDefaults.standard.user ?? User.emptyUser
  }
  
  func updateUser(updatedUser: User) {
    user = updatedUser
    UserDefaults.standard.saveUser(newUser: updatedUser)
  }
}
