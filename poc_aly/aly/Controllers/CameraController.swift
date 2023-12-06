//
//  CameraController.swift
//  aly
//
//  Created by chatrli on 26/10/2023.
//

import Foundation
import SwiftUI
import UIKit

class CameraController: ObservableObject {
    @Published var image: Image? = nil
    
    func didTakePhoto(_ uiImage: UIImage) {
        image = Image(uiImage: uiImage)
    }
}
