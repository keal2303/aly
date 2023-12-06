//
//  alyApp.swift
//  aly
//
//  Created by chatrli on 13/10/2023.
//

import SwiftUI

@main
struct alyApp: App {
    // Initialize model object once for the lifetime of the app
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
