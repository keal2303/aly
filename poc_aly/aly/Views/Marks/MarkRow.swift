//
//  MarkRow.swift
//  aly
//
//  Created by chatrli on 14/10/2023.
//

import SwiftUI

struct MarkRow: View {
    var mark: Mark
    var body: some View {
        HStack {
            mark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(mark.name)
            
            Spacer()
            
            if mark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    let marks = ModelData().marks
    return Group {
            MarkRow(mark: marks[0])
            MarkRow(mark: marks[1])
        }
}
