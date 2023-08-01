//
//  ProductsTableObservable.swift
//
//  Created by Andrejs Melnikovs on 31/07/23.
//

import Foundation
import Observation

@Observable
class ProductsTableObservable {
    
    var fetchPhase = FetchPhase<[Product]>.initial
    
    var products: [Product]? { fetchPhase.value }
    
    func fetchProducts(category: Category) async {
        fetchPhase = .fetching
        var products = Product.stubs
        products = products.filter { product in
            return product.categoryId == category.id;
        }
        products = products
            .enumerated()
            .map { index, product in
                var product = product
                product.pos = index + 1
                return product
            }
        fetchPhase = .success(products)
    }
    
}

extension Product {
    static var stubs: [Product] {
        let url = Bundle.main.url(forResource: "products", withExtension: "json")!
        let productsResponse: ProductsResponse = Utilities.loadStub(url: url)
        return productsResponse.products!
    }
}
