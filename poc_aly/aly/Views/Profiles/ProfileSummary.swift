//
//  ProfileSummary.swift
//  aly
//
//  Created by chatrli on 25/10/2023.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        List {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(profile.username)
                        .bold()
                        .font(.title)
                    Text("Notifications: \(profile.prefersNotifications ? "✅" : "❌")")
                    
                    Divider()
                    
                    Text("Preferences: \(profile.placePreferences.rawValue)")
                    Text("Favorite season: \(profile.seasonPreferences.rawValue)")
                    Text("Places visited: \(profile.placeCounter)")
                }
            }
            
            Link(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=URL@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                Link(destination: URL(string: "https://google.com")!) {
                            Label("About the app", systemImage: "info.circle")
                        }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
}
