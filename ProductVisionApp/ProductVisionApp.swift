//
//  ProductVisionApp.swift
//
//  Created by Andrejs Melnikovs on 31/07/23.
//

import SwiftUI

@main
struct ProductVisionApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ProductsTabItemView()
                    .tabItem { Label("Products", systemImage: "storefront") }
            }
        }
    }
}
