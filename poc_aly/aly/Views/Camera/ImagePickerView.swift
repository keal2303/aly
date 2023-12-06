//
//  ImagePickerView.swift
//  aly
//
//  Created by chatrli on 26/10/2023.
//

import SwiftUI
import UIKit

struct ImagePickerViewController: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerViewController

        init(parent: ImagePickerViewController) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.didTakePhoto(uiImage)
            }
            parent.isPresented = false
        }
    }

    @Binding var isPresented: Bool
    var didTakePhoto: (UIImage) -> Void

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
