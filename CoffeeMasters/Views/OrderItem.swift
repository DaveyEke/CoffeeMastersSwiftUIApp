//
//  OrderItem.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/20/25.
//

import SwiftUI

struct OrderItem: View {
    var item: (Product, Int)
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        HStack {
            Text("\(item.1)x")
            Text(item.0.name)
            Spacer()
            Text("\(Double(item.1)*item.0.price, specifier: "%.2f")")
            Image(systemName: "trash")
                .font(.title)
                .foregroundColor(.sec)
                .padding()
                .onTapGesture {
                 cartManager.remove(product: item.0)
                }
        }
    }
}

#Preview {
    OrderItem(item: (DummyProduct, 1))
        .padding()
}
