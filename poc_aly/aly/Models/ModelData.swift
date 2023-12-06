//
//  ModelData.swift
//  aly
//
//  Created by chatrli on 14/10/2023.
//

import Foundation

// Watch for data changes and display a version of the view after a change
@Observable
class ModelData {
    // Initialize array of marks with the loaded JSON file
    var marks: [Mark] = load("aly_data.json")
    
    // Includes an instance of the user profile that persists even if the view is dismissed
    var profile = Profile.default
    
    var features: [Mark] {
        marks.filter { $0.isFeatured }
    }
    
    // Add dictionary with category name as key and array of associated marks for each key
    var categories: [String: [Mark]] {
        Dictionary(
            grouping: marks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    
    // Holds the raw data read from the file
    let data: Data


    // Loads the file in main bundle
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found in main bundle.")
    }


    // Reads the data and puts it into data constant
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    // Decodes (i.e, convert all JSON strings into objects
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
