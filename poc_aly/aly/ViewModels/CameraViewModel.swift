//
//  CameraViewModel.swift
//  aly
//
//  Created by chatrli on 26/10/2023.
//

import Foundation
import SwiftUI

class CameraViewModel: ObservableObject {
    @Published var image: Image? = nil
    @Published var isCameraPresented: Bool = false

    func didTakePhoto(_ uiImage: UIImage) {
        image = Image(uiImage: uiImage)
        isCameraPresented = false
    }
}

