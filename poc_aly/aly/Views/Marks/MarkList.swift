//
//  MarkList.swift
//  aly
//
//  Created by chatrli on 14/10/2023.
//

import SwiftUI

struct MarkList: View {
    // @Environment reads a value store in an environment
    // Here @Environement basically reads the loaded JSON file
    // modelData gets its value automatically
    @Environment(ModelData.self) var modelData
    
    // Favorites filter state variable
    // Set to private because specific to a view or its subviews
    @State private var showFavoritesOnly = false
    
    // Filtered version of marks list
    var filteredMarks: [Mark] {
        modelData.marks.filter { mark in
            (!showFavoritesOnly || mark.isFavorite)
        }
    }
    
    var body: some View {
        
        // List of marks
        // ForEach let able to combine dynamic views instead of just passing a collection of data with a simple List
        NavigationSplitView {
            List {
                
                // Toggle to filter list of marks binded to showFavoritesOnly
                // $ prefix allows a binding to the state variable
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredMarks) { mark in
                    NavigationLink {
                        MarkDetail(mark: mark)
                    } label: {
                        MarkRow(mark: mark)
                    }
                }
            }
            .navigationTitle("Marks")
        } detail: {
            Text("Select a mark") // Placeholder for iPad
        }
    }
}

#Preview {
    MarkList()
}
