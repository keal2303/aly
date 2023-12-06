//
//  ProfileEditor.swift
//  aly
//
//  Created by chatrli on 25/10/2023.
//

import SwiftUI

struct ProfileEditor: View {
    
    // Binds to draft version of profile
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Season Preferences").bold()
                
                Picker("Season Preferences", selection: $profile.seasonPreferences) {
                    ForEach(Profile.SeasonPreferences.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Picker("Place Preferences", selection: $profile.placePreferences) {
                    ForEach(Profile.PlacePreferences.allCases) { place in
                        Text(place.rawValue).tag(place)
                    }
                }
                .pickerStyle(.menu)
                .bold()
            }
        }
        .cornerRadius(15)
        .padding(5)
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
