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
  private let pistes = Piste.pistes
  
  var body: some View {
    VStack {
      VStack {
        pistePicker
        Divider()
        treats
      }
      .padding()
      .background(Color("lightBG"))
      
      List {
        ForEach(appState.user.logs, id: \.id) { model in
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
              self.appState.log(piste: piste)
          }
        }
      }
    }
  }
  
  private func delete(indexSet: IndexSet) {
    guard let index = indexSet.first else { return }
    appState.removeLog(at: index)
  }
  
  private func treatView(treat: Treat) -> some View {
    let numTreats = Int(appState.user.caloriesSpentToday / treat.calories)
    
    return HStack {
      Text("\(treat.rawValue.uppercased()): ")
        .font(.footnote)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach((0...numTreats), id: \.self) { _ in
            Image(treat.img)
              .resizable()
              .frame(width: 25, height: 25)
              .cornerRadius(12.5)
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
}

struct LogbookView_Previews: PreviewProvider {
  static var previews: some View {
    return LogbookView()
  }
}
