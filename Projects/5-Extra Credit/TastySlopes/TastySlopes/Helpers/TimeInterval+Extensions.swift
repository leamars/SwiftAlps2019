//
//  TimeInterval+Extensions.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 23/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation

extension TimeInterval {
  static let oneMinute: TimeInterval = 60
  static let oneHour: TimeInterval = 3600
  static let oneDay: TimeInterval = 86400
}

extension Int {
  var minutes: TimeInterval {
    return .oneMinute * Double(self)
  }
  
  var hours: TimeInterval {
    return .oneHour * Double(self)
  }
  
  var days: TimeInterval {
    return .oneDay * Double(self)
  }
  
  var minutesFromSeconds: Double {
    return Double(self) / TimeInterval.oneMinute
  }
  
  var timeFromSeconds: String {
    let hours = minutesFromSeconds / 60
    let minutes = minutesFromSeconds.truncatingRemainder(dividingBy: 60)
    
    let intHours = Int(hours)
    let intMinutes = Int(minutes)
    
    var timeString = ""
    
    switch (intHours, intMinutes) {
      
    case (0, 0):
      break
    case (0, 1):
      timeString = "\(intMinutes) min"
    case (0, _):
      timeString = "\(intMinutes) mins"
    case (1, 0):
      timeString = "\(intHours) hr"
    case (_, 1):
      timeString = "\(intHours) hrs"
    case (1, 1):
      timeString = "\(intHours) hr, \(intMinutes) min"
    case (1, _):
      timeString = "\(intHours) hr, \(intMinutes) mins"
    case (_, 1):
      timeString = "\(intHours) hrs, \(intMinutes) min"
    case (1..., 1...):
      timeString = "\(intHours) hrs, \(intMinutes) mins"
    default:
      break
    }
    
    return timeString
  }
  
  var minuteSecondTimeFromSeconds: String {
    let minutes = Int(minutesFromSeconds)
    let seconds = self - minutes * 60
    
    return "\(minutes):\(String(format: "%02d", seconds))"
  }
}
