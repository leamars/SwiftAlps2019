//
//  TastyView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct TastyView: View {
  @EnvironmentObject var appState: AppState
  @ObservedObject var tastyVM: TastyVM
  
  @State private var selectedTreatIndex = 0
  
  // ISSUE: if I have private var here, then we can't compile...
  private(set) var treats: [Treat] = [.toblerone, .swissCheese]
  
  var body: some View {
    VStack {
      Picker(selection: $selectedTreatIndex, label: Text("This appears nowhere, if the style is Segmented...")) {
        ForEach(0 ..< treats.count) {
          Text(self.treats[$0].rawValue.capitalized).tag($0)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      Text("Based on our calculations, you can consume:")
      itemsView
      Text("Calories")
      
      Spacer()
      
      Text("That equals...")
      treatsView
      
      Spacer()
    }
    .navigationBarTitle(Text("Tasty"))
  }
  
  private var itemsView: AnyView? {
    guard let user = tastyVM.user else { return nil }
    
    return AnyView(Text("\(user.maintenanceCalories)"))
  }
  
  private var treatsView: AnyView {
    let selectedTreat = treats[selectedTreatIndex]
    let numTreats = Int(appState.user.maintenanceCalories / selectedTreat.calories)
    
    let treatImages = Array(repeating: selectedTreat.img, count: numTreats)
    var data: [(id: Int, imgStr: String)] = []
    for (id, imgStr) in treatImages.enumerated() {
      data.append((id: id, imgStr: imgStr))
    }
    
    let allTreats: [Treat] = Array(repeating: selectedTreat, count: numTreats)
    var nilChunked = allTreats.nilChunked(into: 3)
    var treatRows: [(view: AnyView, id: Int)] = []
    
    for (index, _) in nilChunked.enumerated() {
      let row = treatRowView(treats: &nilChunked[index])
      treatRows.append((view: row, id: index))
    }
    
    return
      AnyView(ForEach(treatRows, id: \.id) { treatRow in
        treatRow.view
      })
    
  }
  
  private func treatRowView(treats: inout [Treat?]) -> AnyView {
    var first = possibleTreatView(treats: &treats)
    var second = possibleTreatView(treats: &first.data)
    let third = possibleTreatView(treats: &second.data)
    
    return AnyView(HStack {
      first.view
      second.view
      third.view
    })
  }
  
  private func possibleTreatView(treats: inout [Treat?]) -> (view: AnyView?, data: [Treat?]) {
    guard let treat = treats.first as? Treat else { return (view: nil, data: treats) }
    
    treats.removeFirst()
    
    return
      (view: AnyView(Image(treat.img)
        .resizable()
        .frame(width: 100, height: 100)),
       data: treats)
  }
}

struct TastyView_Previews: PreviewProvider {
  static var previews: some View {
    let user = UserDefaults.standard.user
    let tastyVM = TastyVM(user: user)
    
    return TastyView(tastyVM: tastyVM)
  }
}
