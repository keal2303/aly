//
//  ContentView.swift
//  aly
//
//  Created by chatrli on 13/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .paris // tab selection with default value
    
    enum Tab {
        case paris
        case list
        case camera
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Paris", systemImage: "star")
                }
            .tag(Tab.paris)
            
            MarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            CameraView()
                .tabItem {
                    Label("A.I", systemImage: "camera")
                }
                .tag(Tab.camera)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
