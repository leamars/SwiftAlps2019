//
//  Calories.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 03/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation

enum Treat: String {
  case toblerone = "Toblerone"
  case swissCheese = "Swiss Cheese"
  
  // Caloories/100g
  var calories: Int {
    switch self {
      case .toblerone: return 528
      case .swissCheese: return 380
    }
  }
  
  var img: String {
    switch self {
      case .toblerone: return "toblerone"
      case .swissCheese: return "cheese"
    }
  }
}
