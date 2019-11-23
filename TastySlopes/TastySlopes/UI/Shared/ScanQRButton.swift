//
//  ScanQRButton.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 23/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct ScanQRButton: View {
    
    var body: some View {
      VStack {
        Image("qrCode")
          .resizable()
          .cornerRadius(10)
          .frame(width: 100, height: 100)
          .cornerRadius(10)
          .border(Color.black, width: 2)
        
        Text("Scan QR")
      }
    }
}

struct ScanQRButton_Previews: PreviewProvider {
    static var previews: some View {
        ScanQRButton()
    }
}
