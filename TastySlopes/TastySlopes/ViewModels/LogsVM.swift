//
//  LogsVM.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 23/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct LogModel: Identifiable, Codable {
  var id: Date { return run.date }
  var piste: Piste
  var run: Run
}

class LogsVM: ObservableObject {
  @Published var logs: [LogModel] = []
  
  var caloriesSpent: Int {
    return user?.caloriesSpentToday ?? 0
  }
  
  private lazy var pistes = Piste.pistes
  private var user: User?
  
  init(user: User? = nil) {
    self.user = user
    populateValues()
  }
  
  private func populateValues() {
    guard let user = user else { return }
    
    self.logs = user.logs
  }
  
  func log(piste: Piste) {
    let run = Run.random
    let model = LogModel(piste: piste, run: run)
    
    logs.insert(model, at: 0)
  }
  
  func logPiste(id: Int) {
    let piste = Piste.pistes.filter { $0.id == id }.first!
    let run = Run.random
    let model = LogModel(piste: piste, run: run)
    
    logs.insert(model, at: 0)
  }
  
  func removeLog(at index: Int) {
    logs.remove(at: index)
  }
}
