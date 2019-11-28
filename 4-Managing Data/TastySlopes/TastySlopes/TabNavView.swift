//
//  TabNavView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 24/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct TabNavView: View {
  @EnvironmentObject var appState: AppState
  
  var body: some View {
    TabView {
      
      NavigationView {
        ProfileView(profileVM: ProfileVM(user: appState.user))
      }.tabItem {
        Image("profile")
        Text("Profile")
      }
      
      NavigationView {
        LogbookView()
      }.tabItem {
        Image("list")
        Text("Logbook")
      }
    }
  }
}

struct TabNavView_Previews: PreviewProvider {
  static var previews: some View {
    TabNavView()
  }
}
