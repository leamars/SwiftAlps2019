//
//  TabNav.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct TabNavView: View {
  @EnvironmentObject private var appState: AppState
  
  var body: some View {
    TabView(selection: $appState.selectedTab) {
      
      NavigationView {
        profileView
      }.tabItem {
        Text("Profile")
      }.tag(0)
      
      NavigationView {
        logbookView
      }.tabItem {
        Text("Logbook")
      }.tag(1)
    }
  }
  
  private var logbookView: some View {
    return LogbookView(logsVM: LogsVM(user: appState.user))
  }
  
  private var profileView: some View {
    return ProfileView(profileVM: ProfileVM(user: appState.user))
  }
  
}

struct TabNavView_Previews: PreviewProvider {
  static var previews: some View {
    TabNavView()
  }
}
