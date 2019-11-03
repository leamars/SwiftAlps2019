//
//  Array+Extensions.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 03/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation

extension Array {
  func nilChunked(into size: Int) -> [[Element?]] {
    return stride(from: 0, to: count, by: size).map {
      var arr: [Element?] = Array(self[$0 ..< Swift.min($0 + size, count)])
      if arr.count != size {
        let sequence: [Element?] = Array.nilRepeated(count: size - arr.count)
        sequence.forEach { e in
          arr.append(e)
        }
      }
      
      return arr
    }
  }
  
  static func nilRepeated(count: Int) -> [Element?] {
    var arr: [Element?] = []
    for _ in 0..<count {
      arr.append(nil)
    }
    return arr
  }
}
