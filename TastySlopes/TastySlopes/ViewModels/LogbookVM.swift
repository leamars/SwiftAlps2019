//
//  LogbookVM.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct LogModel: Identifiable {
  var id: Date { return run.date }
  var piste: Piste
  var run: Run
}

class LogbookVM: ObservableObject {
  @Published var data: [LogModel] = []
  
  func addNew() {
    let randomModel = LogModel(piste: Piste.random, run: Run.random)
    data.append(randomModel)
  }
}
