//
//  LogbookView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct LogbookView: View {
  
  @EnvironmentObject private var appState: AppState
  @ObservedObject var logsVM: LogsVM
  @State private var cameraPresented: Bool = false
  
  var body: some View {
    return
      VStack {
        addPisteRun
        .padding()
        .background(Color("lightBG"))
                
        List {
          ForEach(logsVM.logs, id: \.id) { model in
            LogView(model: model)
          }
          .onDelete(perform: self.delete)
        }
      }
      .navigationBarTitle(Text("Logbook"))
      .sheet(isPresented: $cameraPresented) {
        // ISSUE (1): Not sure why we need to pass the environment object (maybe because this is not technically a "child", but a sheet/modifier?)
        CameraView(isPresented: self.cameraPresented).environmentObject(self.logsVM)
    }
  }
  
  private var addPisteRun: some View {
    let pistes = Piste.pistes
    let scrollView = ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center) {
        ForEach(pistes, id: \.id) { piste in
          PisteView(piste: piste)
            .onTapGesture {
              self.addRunForPiste(piste: piste)
          }
        }
      }
    }
    return VStack {
      scrollView
      Divider()
      treats
    }
  }
  
  private func treatView(treat: Treat) -> some View {
    let numTreats = Int(logsVM.caloriesSpent / treat.calories)
    return HStack {
      Text("\(treat.rawValue.uppercased()): ")
        .font(.footnote)
            
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach((0...numTreats), id: \.self) { _ in
            Image(treat.img)
            .resizable()
            .frame(width: 25, height: 25)
          }
        }
      }
    }
  }
  
  private var treats: some View {
    return VStack(alignment: .leading, spacing: 8) {
      treatView(treat: .toblerone)
      treatView(treat: .swissCheese)
    }
  }
  
  private func addRunForPiste(piste: Piste) {
    logsVM.logPiste(id: piste.id)
    appState.updateLogs(logs: logsVM.logs)
  }
  
  private func delete(indexSet: IndexSet) {
    guard let index = indexSet.first else { return }
    logsVM.logs.remove(at: index)
    appState.updateLogs(logs: logsVM.logs)
  }
}

struct LogbookView_Previews: PreviewProvider {
  static var previews: some View {
    return LogbookView(logsVM: LogsVM(user: nil))
  }
}
