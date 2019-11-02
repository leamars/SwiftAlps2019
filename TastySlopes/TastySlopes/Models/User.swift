//
//  UserData.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import UIKit

enum Gender {
  case male, female, nonConforming
}

struct User {
  var name: String
  var gender: Gender
  var age: Int
  var weight: Int
  var height: Int
  var runs: Int // Num of runs
  var timeOnRuns: Int // Seconds
  var lifetimeVertical: Int
  var picture: UIImage
  
}
