//
//  UserDefaults+Extensions.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 03/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import Foundation

enum UserDefaultsKey: String {
  case user
}

extension UserDefaults {

  var user: User? {
    let decoder = JSONDecoder()
    
    guard let userData = UserDefaults.standard.object(forKey: UserDefaultsKey.user.rawValue) as? Data,
      let user = try? decoder.decode(User.self, from: userData) else {
      return nil
    }
    
    return user
  }
  
  func saveUser(newUser: User) {
    let encoder  = JSONEncoder()
    
    if let encoded = try? encoder.encode(newUser) {
      set(encoded, forKey: UserDefaultsKey.user.rawValue)
    }
  }
}
