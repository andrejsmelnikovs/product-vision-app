//
//  ProductsTableView.swift
//
//  Created by Andrejs Melnikovs on 31/07/23.
//

import SwiftUI
import SVGImageSwiftUI

struct ProductsTableView: View {
    
    let category: Category
    @Bindable var vm = ProductsTableObservable()
    
    var body: some View {
        Table(of: Product.self) {
            TableColumn("Name") { product in
                HStack {
                    Text(product.posText).fontWeight(.bold).frame(minWidth: 20)
                    
                    Circle().foregroundStyle(Color.gray.opacity(0.5)).frame(width: 40, height: 40)
                 
                    Text(product.name)
                }
            }.width(min: 264)
            
            TableColumn("Count") { Text($0.countText).frame(minWidth: 64) }
                .width(64)
            
            TableColumn("Barcode") { Text($0.barcode).frame(minWidth: 64) }
                .width(128)
            
            TableColumn("Price") { Text($0.priceText).frame(minWidth: 64) }
                .width(64)
        } rows: {
            ForEach(vm.products ?? []) {
                TableRow($0)
            }
        }
        .foregroundStyle(.primary)
        .overlay {
            switch vm.fetchPhase {
                case .fetching: ProgressView()
                case .success(let products) where products.isEmpty:
                    Text("Products not available").font(.headline)
                case .failure(let error):
                    Text(error.localizedDescription).font(.headline)
                default: EmptyView()
            }
        }
        .navigationTitle(category.name)
        .task() {
            await vm.fetchProducts(category: category)
        }
    }
}

#Preview {
    NavigationStack {
        ProductsTableView(category: .defaultCategories[0])
    }
}
