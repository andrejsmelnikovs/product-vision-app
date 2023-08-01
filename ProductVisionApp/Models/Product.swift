//
//  Product.swift
//
//  Created by Andrejs Melnikovs on 31/07/23.
//

import Foundation

public struct Product: Identifiable, Decodable {
    
    public var id: Int
    public var name: String
    public var pos: Int?
    public var categoryId: Int
    
    public var posText: String {
        guard let pos = pos else {
            return "-"
        }
        return String(pos)
    }
    
    public var count: Int?
    public var countText: String {
        guard let count = count else {
            return "-"
        }
        return String(count)
    }
    
    public var barcode: String
    
    public var price: Float?
    public var priceText: String {
        guard let price = price else {
            return "-"
        }
        return String(price)
    }
    
}

public struct ProductsResponse: Decodable {
    
    public var products: [Product]?
    
}
