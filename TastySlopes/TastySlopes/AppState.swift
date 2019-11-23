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
  
  var logsVM: LogsVM
  var profileVM: ProfileVM
  
  init() {
    let user = UserDefaults.standard.user ?? User.emptyUser
    
    self.user = user
    self.logsVM = LogsVM(user: user)
    self.profileVM = ProfileVM(user: user)
  }
  
  func updateProfile(age: Int, weight: Int, height: Int, gender: Gender, active: Bool) {
    user.age = age
    user.weight = weight
    user.height = height
    user.gender = gender
    user.activeLifestyle = active
    
    UserDefaults.standard.saveUser(newUser: user)
  }
  
  func updateLogs(logs: [LogModel]) {
    user.logs = logs
    
    UserDefaults.standard.saveUser(newUser: user)
  }
}
