//
//  LogbookView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct LogbookView: View {
  var body: some View {
    printLogs()
    return Text("Hello, Logbook!")
  }
  
  func printLogs() {
    let vm = LogbookVM()
    vm.populate()
  }
}

struct LogbookView_Previews: PreviewProvider {
  static var previews: some View {
    LogbookView()
  }
}
