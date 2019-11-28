//
//  Log.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct Log: Identifiable, Codable {
  var id: Date { return run.date }
  var piste: Piste
  var run: Run
  
  static var random: Log {
    let piste = Piste.random
    let run = Run.random
    // use color inside
    return Log(piste: piste, run: run)
  }
  
  static var randomLogs: [Log] {
    return (0..<10).map { _ in Log.random }
  }
}

