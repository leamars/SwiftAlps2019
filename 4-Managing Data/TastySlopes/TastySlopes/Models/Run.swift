//
//  Run.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 23/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation

struct Run: Codable {
  var time: Int // Seconds
  var speed: Double // 17.mph
  var date: Date
  
  static var random: Run {
    let time = Int.random(in: 300 ..< 1200)
    let speed = Double.random(in: 28.0 ..< 84)
    let date = Date()
    return Run(time: time, speed: speed, date: date)
  }
}
