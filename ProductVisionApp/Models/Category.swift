//
//  Category.swift
//
//  Created by Andrejs Melnikovs on 31/07/23.
//

import Foundation

public struct Category: Identifiable, Decodable, Hashable {
    
    public let id: Int
    public let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}

public extension Category {
    
    static var defaultCategories: [Category] {
        [
            Category(id: 2014, name: "Fruits & Vegetables"),
            Category(id: 2021, name: "Meat & Fish"),
            Category(id: 2019, name: "Milk & Eggs"),
            Category(id: 2002, name: "Breads"),
            Category(id: 2003, name: "Frozen Products"),
            Category(id: 2015, name: "Packaged Products"),
            Category(id: 2013, name: "Sweets & Snacks"),
            Category(id: 2017, name: "Drinks")
        ]
    }
}
