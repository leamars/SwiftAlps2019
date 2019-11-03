//
//  TastyVM.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 03/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TreatsVM: ObservableObject {
  @Published var user: User?
  
  init(user: User? = nil) {
    self.user = user
  }
}
