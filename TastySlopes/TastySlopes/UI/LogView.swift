//
//  LogView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct LogView: View {
  var model: LogModel
  
  var body: some View {
    HStack(alignment: .top) {
      Spacer()
      
      Image("\(model.piste.imgName)")
        .resizable()
        .frame(width: 70, height: 70, alignment: .center)
        .cornerRadius(6)
      
      Spacer()
      
      VStack(alignment: .leading) {
        
        HStack(alignment: .center) {
          Circle()
            .fill(model.piste.difficulty.color)
            .frame(width: 10, height: 10, alignment: .center)
          
          Text("\(model.piste.name)")
        }
        
        HStack(alignment: .center, spacing: 40) {
          
          VStack(alignment: .center) {
            Text("Distance")
            Text("\(model.piste.distance)")
          }
          VStack(alignment: .center) {
            Text("Speed")
            Text("\(model.run.speed)")
          }
          VStack(alignment: .center) {
            Text("Time")
            Text("\(model.run.time)")
          }
        }
      }
      
      Spacer()
    }
  }
}

struct LogView_Previews: PreviewProvider {
  static var previews: some View {
    let model = LogModel(piste: Piste.random, run: Run.random)
    return LogView(model: model)
  }
}
