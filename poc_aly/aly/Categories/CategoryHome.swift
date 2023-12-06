//
//  CategoryHome.swift
//  aly
//
//  Created by chatrli on 19/10/2023.
//

import SwiftUI

struct CategoryHome: View {
    
    // @Environment reads a value store in an environment
    // Here @Environement basically reads the loaded JSON file
    // modelData gets its value automatically
    @Environment(ModelData.self) var modelData
    
    // Stores the state of showingProfile to determine if the app show it or not
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets()) // set the edge insets to zero to extend the content to the edges of display
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets()) // set the edge insets to zero to extend the content to the edges of display
            }
            .listStyle(.inset)
            .navigationTitle("Paris")
            // add user profile button to the navigation bar
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Mark")
        }
    }
}

#Preview {
    CategoryHome()
}
