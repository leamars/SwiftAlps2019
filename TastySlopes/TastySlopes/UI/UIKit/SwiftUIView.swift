//
//  SwiftUIView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

struct CameraVCRepresentable: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<CameraVCRepresentable>) -> CameraVC {
    return CameraVC()
  }
  
  func updateUIViewController(_ uiViewController: CameraVCRepresentable.UIViewControllerType, context: UIViewControllerRepresentableContext<CameraVCRepresentable>) {
    // N/A
  }
}
