//
//  ProfileView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  @State private var activeLifestyle = false
  @State private var selectedGender = 0
  @State private var genders = Gender.all
  
  @State private var ageStr: String = ""
  @State private var weightStr: String  = ""
  @State private var heightStr: String  = ""
  
  @State private var selectedWeightMeasurement = ""
  @State private var weightOptions = ["kg", "lbs"]
  
  @State private var selectedUnits = 0
  @State private var measurementSystems = ["Metric", "Imperial"]
  
  @State private var isMetricSystem = true
  
  var body: some View {
    return Form {
      Section(header: Text("Personal Info")) {
        Picker(selection: $selectedGender, label: Text("Select a color")) {
          ForEach(0 ..< genders.count) {
            Text(self.genders[$0]).tag($0)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        
        Toggle(isOn: $activeLifestyle) {
          Text("Active Lifestyle")
        }
        
        measureField(title: "Age", binding: $ageStr, append: "years")
      }
      
      Section(header: Text("Measurements")) {
        unitsHeader
        measureField(title: "Weight", binding: $weightStr, append: self.selectedUnits == 0 ? "kg" : "lbs")
        measureField(title: "Height", binding: $heightStr, append: self.selectedUnits == 0 ? "cm" : "inch")
      }
      
      Section(footer: Text("Note: Calorie consumption is calculated based on BMI, age and general fitness activity.")) {
        Button(action: {
          self.dismissKeyboard()
        }) {
          Text("Update profile")
        }
      }
    }
    .navigationBarTitle(Text("Profile"))
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
    
    guard let gender = Gender(rawValue: genders[selectedGender]),
      let weight = Int(weightStr),
      let height = Int(heightStr),
      let age = Int(ageStr) else {
        // Show alers instead
        fatalError("You did not give me all the needed details!!")
    }
    
    let user = User(gender: gender, age: age, weight: weight, height: height, runs: 0, timeOnRuns: 0, lifetimeVertical: 0)
    UserDefaults.standard.saveUser(newUser: user)
  }
  
  private var maintenanceCalories: Double {
    guard let gender = Gender(rawValue: genders[selectedGender]),
      let weight = Double(weightStr),
      let height = Double(heightStr),
      let age = Double(ageStr) else { return 0.0 }
    
    let bmr = gender.k + (gender.weightMult * weight) + (gender.heightMult * height) + (gender.ageMult * age)
    let activityMultiplier = activeLifestyle ? 1.5 : 1.0
    
    return bmr * activityMultiplier
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
