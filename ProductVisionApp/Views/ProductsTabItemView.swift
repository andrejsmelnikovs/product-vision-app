//
//  ProductsTabItemView.swift
//
//  Created by Andrejs Melnikovs on 31/07/23.
//

import SwiftUI

struct ProductsTabItemView: View {
    
    @State var selectedCategory: Category?
    
    var body: some View {
    
        NavigationSplitView {
            List(Category.defaultCategories, id: \.self, selection: $selectedCategory) {
                Text($0.name)
            }.navigationTitle("Products")
        } detail: {
            if let selectedCategory {
                ProductsTableView(category: selectedCategory)
                    .id(selectedCategory)
            } else {
                Text("Select a category")
            }
        }
    }
}

#Preview {
    ProductsTabItemView()
}
