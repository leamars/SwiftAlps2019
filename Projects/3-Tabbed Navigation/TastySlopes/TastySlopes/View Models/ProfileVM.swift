//
//  ProfileVM.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 03/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ProfileVM {
  
  var ageStr: String = ""
  var weightStr: String  = ""
  var heightStr: String  = ""
  var gender: Int = 0
  var activeLifestyle: Bool  = false
  
  lazy var allGenders: [String] = Gender.allStrings
  
  private var user: User
  
  init(user: User) {
    self.user = user
    populateValues()
  }
  
  private func populateValues() {
    guard user.age != 0, user.weight != 0, user.height != 0 else { return }
    
    self.ageStr = "\(user.age)"
    self.weightStr = "\(user.weight)"
    self.heightStr = "\(user.height)"
    self.gender = user.gender.index
    self.activeLifestyle = user.activeLifestyle
  }
  
  func updatedUser() -> User? {
    guard let gender = Gender(rawValue: allGenders[gender]),
      let weight = Int(weightStr), weight != 0,
      let height = Int(heightStr), height != 0,
      let age = Int(ageStr), age != 0 else {
        return nil
    }
    
    let user = User(gender: gender, age: age, weight: weight, height: height, logs: [], activeLifestyle: activeLifestyle)
    return user
  }
}
