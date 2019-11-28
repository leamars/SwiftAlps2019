//
//  UserData.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import UIKit

enum Gender: String, CaseIterable, Codable {
  case female = "F 💁🏻‍♀️"
  case male = "M 🙆🏽‍♂️"
  case nonConforming = "N 👻"
  
  static var allStrings: [String] {
    return [Gender.female, .male, .nonConforming].map { $0.rawValue }
  }
    
  var index: Int {
    switch self {
      case .female: return 0
      case .male: return 1
      case .nonConforming: return 2
    }
  }
  
  var k: Double {
    switch self {
      case .female, .nonConforming:
        return 655.1
      case .male:
        return 66.47
    }
  }
  
  var weightMult: Double {
    switch self {
      case .female, .nonConforming:
        return 4.35
      case .male:
        return 6.24
    }
  }
  
  var heightMult: Double {
    switch self {
      case .female, .nonConforming:
        return 4.7
      case .male:
        return 12.7
    }
  }
  
  var ageMult: Double {
    switch self {
      case .female, .nonConforming:
        return 4.7
      case .male:
        return 6.755
    }
  }
}

struct User: Codable {
  var gender: Gender
  var age: Int
  var weight: Int
  var height: Int
  var logs: [Log]
  var activeLifestyle: Bool
 
  var caloriesSpentToday: Int {
    guard weight != 0, height != 0, age != 0 else { return 0 }
    
    let bmr = gender.k + (gender.weightMult * Double(weight)) + (gender.heightMult * Double(height)) + (gender.ageMult * Double(age))
    let activityMultiplier = (activeLifestyle ? 1.25 : 1.0) // 8 = Skiing MET; https://www.brianmac.co.uk/mets.htm
    let caloriesSpentPerDay = bmr * activityMultiplier
    let caloriesSpentPerMinute: Double = caloriesSpentPerDay / (24 * 60)
    
    let caloriesSpentSkiing = logs.reduce(0) { (sum, model) -> Int in
      let calories = caloriesSpentPerMinute * model.piste.difficulty.metValue * model.run.time.minutesFromSeconds
      return sum + Int(calories)
    }
    
    return caloriesSpentSkiing
  }
  
  static var emptyUser: User {
    return User(gender: .nonConforming, age: 0, weight: 0, height: 0, logs: [], activeLifestyle: false)
  }
}
