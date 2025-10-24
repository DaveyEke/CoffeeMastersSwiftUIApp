//
//  DetailsPage.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/18/25.
//

import SwiftUI

struct DetailsPage: View {
    @State var quantity:Int = 1
    @EnvironmentObject var cartManager:CartManager
    @State var showingAlert = false
    @Environment(\.dismiss) var dismiss
    var product: Product
    
    var body: some View {
        ScrollView {
            AsyncImage(url: product.imageURL)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: 150)
                .padding(.top, 32)
            Text(product.name)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding(24)
            Text(product.description)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding(24)
                .foregroundColor(Color("primaryColour"))
            HStack {
                Text("$ \(product.price, specifier: "%.2f") ea")
                Stepper(value: $quantity, in: 1...10) { }
            }
                .frame(maxWidth: .infinity)
                .padding(30)
                            
            Text("Subtotal \(Double(quantity) * product.price, specifier: "%.2f")")
                .bold()
                .padding(12)
            
            Button("Add \(quantity) to Cart") {
                cartManager.add(product: product, quantity: quantity)
                showingAlert = true
            }
            .padding()
            .frame(width: 250.0)
            .background(Color("Alternative2"))
            .foregroundColor(Color.black)
            .cornerRadius(25)
            .alert("Added to Cart", isPresented: $showingAlert) {
                Button("Continue Shopping") {
                    showingAlert = false
                    dismiss()
                }
            } message: {
                Text("\(quantity) \(product.name) added to your cart!")
            }
        }
        .navigationTitle(product.name)
        .toolbar {
            LikeButton(product: product)
        }
    }
}

#Preview {
    DetailsPage(product: DummyProduct)
        .environmentObject(CartManager())
        .environmentObject(LikesManager())
}
