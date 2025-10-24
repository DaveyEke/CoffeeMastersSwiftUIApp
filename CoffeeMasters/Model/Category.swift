//
//  Category.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/20/25.
//

import Foundation

struct Category: Decodable, Identifiable {
    var name: String
    var products: [Product]
    var id: String {
        return self.name
    }
    func filteredItems(text: String) -> [Product] {
        if text.count > 0 {
            return products.filter({ product in
                product.name.contains(text)
            })
        } else {
            return products
            
        }
        
    }
    
}
