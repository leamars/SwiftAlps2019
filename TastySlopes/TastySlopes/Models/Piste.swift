//
//  Slope.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI

enum Difficulty: String, Codable {
  case easy, intermediate, difficult
  
  var color: Color {
    switch self {
      case .easy:
        return Color.blue
      case .intermediate:
        return Color.red
      case .difficult:
        return Color.black
    }
  }
}

struct Piste: Codable, Identifiable {
  var id: Int
  var name: String
  var imgName: String
  var difficulty: Difficulty
  var vertical: Double // Elevation
  var distance: Double // km
}

struct Run {
  var time: Int // Seconds
  var speed: Double // 17.mph
  var date: Date
  
  static var randomRun: Run {
    let time = Int.random(in: 300 ..< 1200)
    let speed = Double.random(in: 28.0 ..< 84)
    let date = Date()
    return Run(time: time, speed: speed, date: date)
  }
}
