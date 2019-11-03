//
//  SwiftUIView.swift
//  TastySlopes
//
//  Created by Lea Marolt Sonnenschein on 02/11/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI
import CoreImage

struct TakePhotoView: UIViewControllerRepresentable {
  @EnvironmentObject var logbookVM: LogbookVM
  @Binding var isDisplayed: Bool
  
  final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // ISSUE (3): Not sure why we need to pass the environment object (maybe because this is not technically a "child", but a sheet/modifier?)
    //@EnvironmentObject var logbookVM: LogbookVM
    @Binding var isDisplayed: Bool
    private var successfulScanClosure: (_ pisteId: Int) -> Void
    
    init(isDisplayed: Binding<Bool>, successfulScanClosure: @escaping (Int) -> Void) {
      self._isDisplayed = isDisplayed
      self.successfulScanClosure = successfulScanClosure
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      self.isDisplayed = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      //guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
      guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
        let cgImage = image.cgImage,
        let ciDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh]),
        let feature = ciDetector.features(in: CIImage(cgImage: cgImage)).first as? CIQRCodeFeature,
        let message = feature.messageString,
        let pisteId = Int(message)  else { return }
      
      successfulScanClosure(pisteId)
      isDisplayed = false
    }
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<TakePhotoView>) -> UIImagePickerController {
    let imagePicker = UIImagePickerController()
    guard UIImagePickerController.isSourceTypeAvailable(imagePicker.sourceType) else {
      fatalError("Source unavailable.")
    }
    
    imagePicker.sourceType = .camera
    imagePicker.allowsEditing = false
    
    return imagePicker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<TakePhotoView>) {
      uiViewController.delegate = context.coordinator
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(isDisplayed: self._isDisplayed, successfulScanClosure: { id in
      self.logbookVM.logPiste(with: id)
    })
  }
}
