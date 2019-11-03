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

enum DataState {
  case initial
  case loading
  case hasData
  case failed
}

struct LogModel: Identifiable {
  var id: Date { return run.date }
  var piste: Piste
  var run: Run
}

class LogbookVM: ObservableObject {
  @Published var data: [LogModel] = []
  private lazy var pistes = Piste.pistes
  private (set) var state: DataState = .initial
  
  func addRandom() {
    let randomModel = LogModel(piste: Piste.random, run: Run.random)
    data.append(randomModel)
  }
  
  func logPiste(with id: Int) {
    let piste = pistes.filter { $0.id == id }.first!
    let run = Run.random
    let model = LogModel(piste: piste, run: run)
    
    data.append(model)
  }
}
