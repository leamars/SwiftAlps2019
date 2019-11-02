//
//  TabNav.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct TabNavView: View {
  @State var selectedTab = 2
  var body: some View {
    TabView(selection: $selectedTab) {
      
      NavigationView {
        TastyView()
      }.tabItem {
        Text("Tasty")
      }.tag(0)
      
      NavigationView {
        LogbookView()
      }.tabItem {
        Text("Logbook")
      }.tag(1)
      
      NavigationView {
        ProfileView()
      }.tabItem {
        Text("Profile")
      }.tag(2)
    }
  }
}

struct TabNavView_Previews: PreviewProvider {
  static var previews: some View {
    TabNavView()
  }
}
