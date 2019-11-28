//
//  Piste.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 23/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI

enum Difficulty: String, Codable {
  case easy, intermediate, hard
  
  var color: Color {
    switch self {
      case .easy:
        return Color.blue
      case .intermediate:
        return Color.red
      case .hard:
        return Color.black
    }
  }
  
  var metValue: Double {
    switch self {
      case .easy:
        return 6
      case .intermediate:
        return 7
      case .hard:
        return 8
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
  
  static var random: Piste {
    let pistes = Piste.pistes
    let index = Int.random(in: 0 ..< pistes.count)
    return pistes[index]
  }
  
  static var pistes: [Piste] {
    guard let url = Bundle.main.url(forResource: "slopesData", withExtension: "json"),
      let jsonData = try? Data(contentsOf: url) else {
      fatalError("Failed to load data local file.")
    }
    
    let decoder = JSONDecoder()
    guard let decoded = try? decoder.decode([Piste].self, from: jsonData) else {
      fatalError("Failed to decode data.")
    }
    
    return decoded
  }
}
