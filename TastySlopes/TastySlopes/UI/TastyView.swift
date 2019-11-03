//
//  TastyView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct TastyView: View {
  @EnvironmentObject private var appState: AppState
  @ObservedObject var tastyVM: TastyVM
  
  var body: some View {
    VStack {
      Text("Based on our calculations, you can consume:")
      itemsView
      Text("Calories")
    }
    .navigationBarTitle(Text("Tasty"))
  }
  
  var itemsView: AnyView? {
    guard let user = tastyVM.user else { return nil }
    
    return AnyView(Text("\(user.maintenanceCalories)"))
  }
}

struct TastyView_Previews: PreviewProvider {
  static var previews: some View {
    let user = UserDefaults.standard.user
    let tastyVM = TastyVM(user: user)
    
    return TastyView(tastyVM: tastyVM)
  }
}
