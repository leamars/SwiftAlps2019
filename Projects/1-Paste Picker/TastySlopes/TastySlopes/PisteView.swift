//
//  PisteView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 23/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct PisteView: View {
  
  var piste: Piste
  
  var body: some View {
    VStack {
      Image(piste.imgName)
      .resizable()
      .frame(width: 100, height: 100)
      .cornerRadius(10)
      
      Text(piste.name)
    }
  }
}

struct PisteView_Previews: PreviewProvider {
  static var previews: some View {
    let piste = Piste.pistes.first!
    return PisteView(piste: piste)
  }
}
