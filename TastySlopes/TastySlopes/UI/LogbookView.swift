//
//  LogbookView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct LogbookView: View {
  
  @EnvironmentObject var logbookVM: LogbookVM
  @State private var cameraPresented: Bool = false
  
  var body: some View {
    return
      VStack {
        List {
          ForEach(logbookVM.data, id: \.id) { model in
            LogView(model: model)
          }
          .onDelete(perform: self.delete)
        }
        addNewButton
    }
    .navigationBarTitle(Text("Logbook"))
    .sheet(isPresented: $cameraPresented) {
      // ISSUE (1): Not sure why we need to pass the environment object (maybe because this is not technically a "child", but a sheet/modifier?)
      CameraView(isPresented: self.cameraPresented).environmentObject(self.logbookVM)
    }
  }
  
  private var addNewButton: some View {
    Button(action: {
      //sself.cameraPresented = true
      self.addRandomRun()
    }) {
      AddRunView()
    }
  }
  
  private func addRandomRun() {
    logbookVM.addRandom()
  }
  
  private func delete(indexSet: IndexSet) {
    guard let index = indexSet.first else { return }
    logbookVM.data.remove(at: index)
  }
}

struct LogbookView_Previews: PreviewProvider {
  static var previews: some View {
    let logbookVM = LogbookVM()
    return LogbookView().environmentObject(logbookVM)
  }
}
