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
  
  static var all: [String] {
    return [Gender.female, .male, .nonConforming].map { $0.rawValue }
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
  var runs: Int // Num of runs
  var timeOnRuns: Int // Seconds
  var lifetimeVertical: Int  
}
