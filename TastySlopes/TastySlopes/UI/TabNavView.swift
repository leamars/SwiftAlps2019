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
  @EnvironmentObject private var treatsVM: TreatsVM
  private var logbookVM = LogbookVM()
  
  var body: some View {
    TabView(selection: $appState.selectedTab) {
      
      NavigationView {
        treatsView
      }.tabItem {
        Text("Treats")
      }.tag(0)
      
      NavigationView {
        logbookView
      }.tabItem {
        Text("Logbook")
      }.tag(1)
      
      NavigationView {
        profileView
      }.tabItem {
        Text("Profile")
      }.tag(2)
    }
  }
  
  private var logbookView: some View {
    return LogbookView().environmentObject(logbookVM).environmentObject(appState)
  }
  
  private var profileView: some View {
    return ProfileView(profileVM: ProfileVM(user: appState.user))
  }
  
  private var treatsView: some View {
    return TreatsView(treatsVM: treatsVM).environmentObject(appState)
  }
}

struct TabNavView_Previews: PreviewProvider {
  static var previews: some View {
    TabNavView()
  }
}
