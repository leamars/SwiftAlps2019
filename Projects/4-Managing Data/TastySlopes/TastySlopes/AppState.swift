//
//  AppState.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 25/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AppState: ObservableObject {
  @Published var user: User
  
  init() {
    self.user = UserDefaults.standard.user ?? User.emptyUser
  }
  
  func log(piste: Piste) {
    let run = Run.random
    let model = Log(piste: piste, run: run)
    
    user.logs.insert(model, at: 0)
    UserDefaults.standard.saveUser(newUser: user)
  }
  
  func removeLog(at index: Int) {
    user.logs.remove(at: index)
    UserDefaults.standard.saveUser(newUser: user)
  }
  
  func updateProfile(age: Int, weight: Int, height: Int, gender: Gender, active: Bool) {
    
    user.age = age
    user.weight = weight
    user.height = height
    user.gender = gender
    user.activeLifestyle = active
    
    UserDefaults.standard.saveUser(newUser: user)
  }
}

