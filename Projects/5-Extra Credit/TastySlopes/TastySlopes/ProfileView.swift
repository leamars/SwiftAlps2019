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
  @State var showingMissingDetailsAlert = false
  @State var showingPrivacyPolicy = false
  
  var body: some View {
    return Form {
      Section(header: Text("Personal Info")) {
        Picker(selection: $profileVM.gender, label: Text("Select a color")) {
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
      
      Section {
        // Show navigation view that pushes
        
        NavigationLink(destination:
          PrivacyPolicyView())
        {
          Text("Privacy Policy")
        }
        
        // Show modal navigation view
//        Button(action: {
//          self.showingPrivacyPolicy = true
//        }) {
//          Text("Privacy Policy")
//        }
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
      .alert(isPresented: $showingMissingDetailsAlert) {
        missingDetailsAlert
    }
    .sheet(isPresented: $showingPrivacyPolicy) {
      PrivacyPolicyView()
    }
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
      self.showingMissingDetailsAlert.toggle()
      return
    }
    
    appState.updateProfile(age: user.age,
                           weight: user.weight,
                           height: user.height,
                           gender: user.gender,
                           active: user.activeLifestyle)
  }
  
  private var missingDetailsAlert: Alert {
    return Alert(
      title: Text("Missing details!"),
      message: Text("Make sure to fill out all your details, otherwise we can't calculate how many treats you deserve!r"),
      dismissButton:
      .default(Text("OK"), action: {
        self.showingMissingDetailsAlert.toggle()
      })
    )
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(profileVM: ProfileVM(user: User.emptyUser))
  }
}
