//
//  LogView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct LogView: View {
  var model: Log
  
  var logs = [Log]
  
  var body: some View {

    HStack(alignment: .top) {
      
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
            .font(.headline)
        }
        
        HStack(alignment: .center, spacing: 40) {
          
          VStack(alignment: .leading) {
            Text("Distance:".uppercased())
              .font(.footnote)
            Text(String(format: "%.1f mi", model.piste.distance))
              .font(.caption)
          }
          VStack(alignment: .leading) {
            Text("Speed:".uppercased())
              .font(.footnote)
            Text(String(format: "%.1f mph", model.run.speed))
              .font(.caption)
          }
          VStack(alignment: .leading) {
            Text("Time:".uppercased())
              .font(.footnote)
            Text("\(model.run.time.timeFromSeconds)")
              .font(.caption)
          }
        }
      }
      
      Spacer()
    }
  }
}

struct LogView_Previews: PreviewProvider {
  static var previews: some View {
    let model = Log(piste: Piste.random, run: Run.random)
    return LogView(model: model)
  }
}
