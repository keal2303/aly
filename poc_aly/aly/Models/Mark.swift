//
//  Mark.swift
//  aly
//
//  Created by chatrli on 13/10/2023.
//

import Foundation
import SwiftUI
import CoreLocation
struct Mark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case monument = "Monument"
        case museum = "Museum"
    }
    
    // Property to be read, this is the name of the image file
    private var imageName: String
    
    // Retrieve image from the imageName
    var image: Image {
        Image(imageName)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    // Defines coordinates from storage to convert it into a CLLocationCoordinate2D object
    private var coordinates: Coordinates
    
    // Convert coordinates from storage to a usable CLLocationCoordinate2D object
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
