//
//  CameraView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct CameraView: View {
  
  @EnvironmentObject var logbookVM: LogbookVM
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State var isPresented: Bool
  
  var body: some View {
    if !isPresented {
      presentationMode.wrappedValue.dismiss()
    }
    
    // ISSUE (2): Not sure why we need to pass the environment object (maybe because this is not technically a "child", but a sheet/modifier?)
    return TakePhotoView(isDisplayed: $isPresented).environmentObject(self.logbookVM)
  }
}

struct CameraView_Previews: PreviewProvider {
  
  static var previews: some View {
    CameraView(isPresented: true)
  }
}
