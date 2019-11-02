//
//  Date+Extensions.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation

extension Date {
  
  var idFromDate: Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMddYYYYHHmmss"
    let date = Date()
    let dateString = dateFormatter.string(from: date)
    
    guard let dateInt = Int(dateString) else {
      fatalError("Couldn't make Int our of Date String for Date: \(date) ")
    }
    
    return dateInt
  }
}
