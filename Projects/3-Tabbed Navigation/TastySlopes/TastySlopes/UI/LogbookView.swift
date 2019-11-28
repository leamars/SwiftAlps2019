//
//  LogbookView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct LogbookView: View {
  
  private var pistes = Piste.pistes
  @State private var logs = Log.randomLogs
  
  var body: some View {
    VStack {
      pistePicker
        .padding()
        .background(Color("lightBG"))
      
      List {
        ForEach(logs, id: \.id) { model in
          LogView(model: model)
        }
        .onDelete(perform: self.delete)
      }
    }
    .navigationBarTitle("Logbook")
  }
  
  private var pistePicker: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center) {
        ForEach(pistes, id: \.id) { piste in
          PisteView(piste: piste)
            .onTapGesture {
              self.logs.insert(Log(piste: piste, run: Run.random), at: 0)
          }
        }
      }
    }
  }
  
  private func delete(indexSet: IndexSet) {
    guard let index = indexSet.first else { return }
    logs.remove(at: index)
  }
}

struct LogbookView_Previews: PreviewProvider {
  static var previews: some View {
    return LogbookView()
  }
}
