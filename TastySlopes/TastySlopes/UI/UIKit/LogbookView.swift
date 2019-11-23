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
  @EnvironmentObject var logbookVM: LogbookVM
  @State private var cameraPresented: Bool = false
  
  var body: some View {
    return
      VStack {
        addPisteRun
        .padding()
        .background(Color("lightBG"))
        
        treats
        
        List {
          ForEach(logbookVM.data, id: \.id) { model in
            LogView(model: model)
          }
          .onDelete(perform: self.delete)
        }
      }
      .navigationBarTitle(Text("Logbook"))
      .sheet(isPresented: $cameraPresented) {
        // ISSUE (1): Not sure why we need to pass the environment object (maybe because this is not technically a "child", but a sheet/modifier?)
        CameraView(isPresented: self.cameraPresented).environmentObject(self.logbookVM)
    }
  }
  
  private var addPisteRun: some View {
    let pistes = Piste.pistes
    return ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center) {
        ForEach(pistes, id: \.id) { piste in
          PisteView(piste: piste)
            .onTapGesture {
              self.addRunForPiste(piste: piste)
          }
        }
      }
    }
  }
  
  private func treatView(treat: Treat) -> some View {
    let numTreats = Int(appState.user.maintenanceCalories / treat.calories)
    return VStack {
      Text("\(treat.rawValue): ")
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .center) {
         Image(treat.img)
        }
      }
    }
  }
  
  private var treats: some View {
    return VStack {
      treatView(treat: .toblerone)
      treatView(treat: .swissCheese)
    }
  }
  
  private func addRunForPiste(piste: Piste) {
    logbookVM.logPiste(with: piste.id)
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
