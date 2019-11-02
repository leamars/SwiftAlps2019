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

class LogbookVM: ObservableObject {
  var data: [Piste] = []
  
  init() {
    populate()
  }
  
  private func populate() {
    
    guard let url = Bundle.main.url(forResource: "slopesData", withExtension: "json"),
      let jsonData = try? Data(contentsOf: url) else {
      fatalError("Failed to load data local file.")
    }
    
    let decoder = JSONDecoder()
    guard let decoded = try? decoder.decode([Piste].self, from: jsonData) else {
      fatalError("Failed to decode data.")
    }
    
    data = decoded
  }
}
