//
//  CategoryRow.swift
//  aly
//
//  Created by chatrli on 19/10/2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Mark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { mark in
                        NavigationLink {
                            MarkDetail(mark: mark)
                        } label: {
                            CategoryItem(mark: mark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let marks = ModelData().marks
    return CategoryRow(categoryName: marks[0].category.rawValue, items: Array(marks.prefix(3)))
}
