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

class ProfileVM: ObservableObject {
  
  @Published var ageStr: String = ""
  @Published var weightStr: String  = ""
  @Published var heightStr: String  = ""
  @Published var gender: Int  = 0
  @Published var activeLifestyle: Bool  = false
  var allGenders: [String] = Gender.allStrings
  
  private var user: User?
  
  init(user: User? = nil) {
    self.user = user
    populateValues()
  }
  
  private func populateValues() {
    guard let user = user else { return }
    
    self.ageStr = "\(user.age)"
    self.weightStr = "\(user.weight)"
    self.heightStr = "\(user.height)"
    self.gender = user.gender.index
    self.activeLifestyle = user.activeLifestyle
  }
  
  func newUser() -> User? {
    guard let gender = Gender(rawValue: allGenders[gender]),
      let weight = Int(weightStr),
      let height = Int(heightStr),
      let age = Int(ageStr) else {
        return nil
    }
    
    let user = User(gender: gender, age: age, weight: weight, height: height, runs: 0, timeOnRuns: 0, lifetimeVertical: 0, activeLifestyle: activeLifestyle)
    return user
  }
}
