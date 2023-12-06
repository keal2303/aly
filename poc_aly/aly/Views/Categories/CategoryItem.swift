//
//  CategoryItem.swift
//  aly
//
//  Created by chatrli on 25/10/2023.
//

import SwiftUI

struct CategoryItem: View {
    var mark: Mark
    
    var body: some View {
        VStack(alignment: .leading) {
            mark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(mark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(mark: ModelData().marks[0])
}
