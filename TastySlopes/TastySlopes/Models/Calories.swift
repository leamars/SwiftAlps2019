//
//  Calories.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 03/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation

enum CaloryTypes {
  case toblerone
  case swissCheese
  
  // Caloories/100g
  var calories: Int {
    switch self {
      case .toblerone: return 528
      case .swissCheese: return 380
    }
  }
}
