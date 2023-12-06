//
//  CameraView.swift
//  aly
//
//  Created by chatrli on 26/10/2023.
//

import SwiftUI

struct CameraView: View {
    @ObservedObject var imagePickerModel = ImagePickerModel()
    
    
    var body: some View {
        VStack {
            
            // Use method from ImagePicker model to open camera with UIKit
            Button(action: {
                imagePickerModel.takePicture()
            }) {
                Text("Take Picture")
            }
            
            
            if let image = imagePickerModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }
        
    }
}

#Preview {
    CameraView()
}
