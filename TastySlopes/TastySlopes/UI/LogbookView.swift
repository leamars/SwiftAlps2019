//
//  LogbookView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct LogbookView: View {
  
  @ObservedObject var logbookVM: LogbookVM
  
  var body: some View {
    return
      VStack {
        List {
          ForEach(logbookVM.data, id: \.id) { model in
            LogView(model: model)
          }
        }
        addNewButton
    }
    .navigationBarTitle(Text("Logbook"))
  }
  
  private var addNewButton: some View {
    Button(action: {
      self.addNewRun()
    }) {
      AddRunView()
    }
  }
  
  private func addNewRun() {
    logbookVM.addNew()
  }
}

struct LogbookView_Previews: PreviewProvider {
  static var previews: some View {
    let logbookVM = LogbookVM()
    return LogbookView(logbookVM: logbookVM)
  }
}
