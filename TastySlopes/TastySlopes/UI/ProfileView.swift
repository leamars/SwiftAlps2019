//
//  ProfileView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject private var appState: AppState
  @ObservedObject var profileVM: ProfileVM
    
  @State private var selectedUnits = 0
  @State private var measurementSystems = ["Metric", "Imperial"]
  @State var showingMissingDetailsAlert = false
    
  var body: some View {
    return Form {
      Section(header: Text("Personal Info")) {
        Picker(selection: $profileVM.gender, label: Text("Select a color")) {
          ForEach(0 ..< profileVM.allGenders.count) {
            Text(self.profileVM.allGenders[$0]).tag($0)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        
        Toggle(isOn: $profileVM.activeLifestyle) {
          Text("Active Lifestyle")
        }
        
        measureField(title: "Age", binding: $profileVM.ageStr, append: "years")
      }
      
      Section(header: Text("Measurements")) {
        unitsHeader
        measureField(title: "Weight", binding: $profileVM.weightStr, append: self.selectedUnits == 0 ? "kg" : "lbs")
        measureField(title: "Height", binding: $profileVM.heightStr, append: self.selectedUnits == 0 ? "cm" : "inch")
      }
      
      Section(footer: Text("Note: Calorie consumption is calculated based on BMI, age and general fitness activity.")) {
        Button(action: {
          self.dismissKeyboard()
        }) {
          Text("Update profile")
        }
      }
      
      Section {
        List {
          NavigationLink(destination:
            PrivacyPolicyView())
          {
            Text("Privacy Policy")
          }
        }
      }
    }
    .navigationBarTitle(Text("Profile"))
    .alert(isPresented: $showingMissingDetailsAlert) {
      missingDetailsAlert
    }
  }
  
  private var unitsHeader: some View {
    GeometryReader { geometry in
      HStack(alignment: .center) {
        
        Text("Units")
        
        Spacer()
        
        self.unitPicker
          .frame(width: geometry.size.width/1.5)
        
      }
    }
  }
  
  private var unitPicker: some View {
    Picker(selection: $selectedUnits, label: Text("Units")) {
      ForEach(0 ..< measurementSystems.count) {
        Text(self.measurementSystems[$0]).tag($0)
      }
    }
    .pickerStyle(SegmentedPickerStyle())
  }
  
  private func measureField(title: String, binding: Binding<String>, append: String) -> some View {
    HStack {
      TextField(title, text: binding)
        .keyboardType(.numberPad)
      
      Text(append)
    }
  }
  
  private func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    
    guard let user = profileVM.newUser() else {
      showingMissingDetailsAlert.toggle()
      return
    }
    appState.updateUser(updatedUser: user)
  }
  
  private var missingDetailsAlert: Alert {
    return Alert(
      title: Text("Missing details!"),
      message: Text("Make sure to fill out all your details, otherwise we can't calculate your recommended daily caloric intake."),
      dismissButton:
        .default(Text("OK"), action: {
          self.showingMissingDetailsAlert.toggle()
        })
    )
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(profileVM: ProfileVM(user: nil))
  }
}
