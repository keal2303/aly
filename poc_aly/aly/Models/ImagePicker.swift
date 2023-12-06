//
//  ImagePicker.swift
//  aly
//
//  Created by chatrli on 26/10/2023.
//

import Foundation
import SwiftUI
import UIKit

class ImagePickerModel: ObservableObject {
    @Published var image: UIImage?
    private var imagePickerController = UIImagePickerController()

    init() {
        self.imagePickerController.delegate = ContextCoordinator(parent: self)
    }

    func takePicture() {
        self.imagePickerController.sourceType = .camera
        UIApplication.shared.windows.first?.rootViewController?.present(self.imagePickerController, animated: true, completion: nil)
    }

    class ContextCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerModel
        
        init(parent: ImagePickerModel) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            picker.dismiss(animated: true)
        }
    }
}
