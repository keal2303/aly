//
//  ProfileHost.swift
//  aly
//
//  Created by chatrli on 25/10/2023.
//

import SwiftUI

struct ProfileHost: View {
    // SwiftUI provides storage in the environment for values you can access using the @Environment property wrapper. Access the editMode value to read or write the edit scope
    @Environment(\.editMode) var editMode
    
    // Reads user's profile data from the @Environment so control of the data is passed to ProfileHost
    @Environment(ModelData.self) var modelData
    
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
