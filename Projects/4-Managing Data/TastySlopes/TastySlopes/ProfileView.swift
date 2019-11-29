//
//  ProfileView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 28/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject private var appState: AppState
  @ObservedObject var profileVM: ProfileVM
    
  var body: some View {
    return Form {
      Section(header: Text("Personal Info")) {
        Picker(selection: $profileVM.gender, label: Text("Select a gender")) {
          ForEach(0 ..< Gender.allStrings.count) {
            Text(Gender.allStrings[$0]).tag($0)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        
        Toggle(isOn: $profileVM.activeLifestyle) {
          Text("Active Lifestyle")
        }
        
        measureField(title: "Age", binding: $profileVM.ageStr, append: "years")
      }
      
      Section(header: Text("Measurements"), footer: Text("Note: Calorie consumption is calculated based on BMI, age and general fitness activity.")) {
        measureField(title: "Weight", binding: $profileVM.weightStr, append: "kg")
        measureField(title: "Height", binding: $profileVM.heightStr, append: "cm")
      }
    }
    .navigationBarTitle(Text("Profile"))
    .navigationBarItems(trailing:
      Button(action: {
        self.updateProfile()
      }) {
        Text("Save")
      }
    )
  }
  
  private func measureField(title: String, binding: Binding<String>, append: String) -> some View {
    HStack {
      TextField(title, text: binding)
        .keyboardType(.numberPad)
      
      Text(append)
    }
  }
  
  private func updateProfile() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    
    guard let user = profileVM.updatedUser() else {
      return
    }
    
    appState.updateProfile(age: user.age,
                           weight: user.weight,
                           height: user.height,
                           gender: user.gender,
                           active: user.activeLifestyle)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(profileVM: ProfileVM(user: User.emptyUser))
  }
}
