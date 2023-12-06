//
//  FavoriteButton.swift
//  aly
//
//  Created by chatrli on 14/10/2023.
//

import SwiftUI

struct FavoriteButton: View {
    
    // Indicates the current button state
    @Binding var isSet: Bool
    var body: some View {
        
        // Triggers isSet state change
        // According to isSet value, change icon and icon color
        Button {
            isSet.toggle()
        } label: {
            Label("Set favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
