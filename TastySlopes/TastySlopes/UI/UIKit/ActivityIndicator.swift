//
//  ActivityIndicator.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
  
  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let view = UIActivityIndicatorView(style: .medium)
    return view
  }
  
  func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
    activityIndicator.startAnimating()
  }
}
