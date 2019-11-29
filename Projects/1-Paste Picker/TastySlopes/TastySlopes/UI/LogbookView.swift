//
//  LogbookView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct LogbookView: View {

  private var pistes = Piste.pistes

  var body: some View {
    pistePicker
    .padding()
    .background(Color("lightBG"))
  }

  var pistePicker: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center) {
        ForEach(pistes, id: \.id) { piste in
          PisteView(piste: piste)
            .onTapGesture {
              print(piste.name)
          }
        }
      }
    }
  }
}

struct LogbookView_Previews: PreviewProvider {
  static var previews: some View {
    return LogbookView()
  }
}
