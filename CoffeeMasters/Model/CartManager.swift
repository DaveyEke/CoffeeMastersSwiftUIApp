//
//  CartManager.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/20/25.
//

import Foundation
import Combine

class CartManager: ObservableObject {
    @Published var cart: [(Product, Int)] = []
    
    func add(product: Product, quantity:Int) {
        self.cart.append((product, quantity))
    }
    
    func remove(product:Product){
        self.cart.removeAll { itemsinCart in
            return itemsinCart.0.id == product.id
        }
    }
     
    func total() -> Double {
            var total = 0.0
            for item in cart {
                total += item.0.price * Double(item.1)
            }
            return total
        }
}
