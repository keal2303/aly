//
//  MarkDetail.swift
//  aly
//
//  Created by chatrli on 14/10/2023.
//

import SwiftUI

struct MarkDetail: View {
    // @Environment reads a value store in an environment
    // Here @Environement basically reads the loaded JSON file
    // modelData gets its value automatically
    // This is needed to compare inputed index with the model data
    @Environment(ModelData.self) var modelData
    
    var mark: Mark
    
    // Computes the index of the input mark by comparing it with the model data
    // Requires @Environment variable with model data passed inside
    var markIndex: Int {
        modelData.marks.firstIndex(where: { $0.id == mark.id })!
    }
    
    // Create URL to navigate in Maps
    func navigationURL() -> URL {
            let coordinate = mark.locationCoordinate
            let urlString = "http://maps.apple.com/?daddr=\(coordinate.latitude),\(coordinate.longitude)"
            return URL(string: urlString)!
        }
    
    var body: some View {
        
        // Add model data
        @Bindable var modelData = modelData
        
        ScrollView {
            MapView(coordinate: mark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: mark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(mark.name)
                        .font(.title)
                    
                    // Triggers the isSet method to change the isFavorite value of the mark
                    // Uses markIndex and modelData to ensure the stored mark isFavorite update
                    // $ prefix allows a binding to the environment variable
                    FavoriteButton(isSet: $modelData.marks[markIndex].isFavorite)
                }
                
                HStack {
                    Text(mark.park)
                    
                    Spacer()
                    
                    Text(mark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(mark.name)")
                    .font(.title2)
                
                Text(mark.description)
                
                Link(destination: navigationURL()) {
                    HStack {
                        Image(systemName: "mappin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                        Text("Navigate")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                }
                .padding([.top, .bottom])
            }
            .padding()
        }
        .navigationTitle(mark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MarkDetail(mark: ModelData().marks[0])
}
