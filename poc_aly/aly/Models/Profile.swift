//
//  Profile.swift
//  aly
//
//  Created by chatrli on 25/10/2023.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonPreferences = SeasonPreferences.winter
    var placePreferences = PlacePreferences.museum
    var placeCounter = 0
    
    static let `default` = Profile(username: "aaa777")
    
    enum SeasonPreferences: String, CaseIterable, Identifiable {
        case spring = "🌺"
        case summer = "☀️"
        case autumn = "🍁"
        case winter = "❄️"
        
        var id: String { rawValue }
    }
    
    enum PlacePreferences: String, CaseIterable, Identifiable {
        case museum = "Museum"
        case monument = "Monument"
        
        var id: String { rawValue }
    }
}
