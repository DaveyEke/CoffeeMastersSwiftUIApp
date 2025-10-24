//
//  ContentView.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/16/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        TabView {
            MenuPage()
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("Menu")
                }
            OffersPage()
                .tabItem {
                    Image(systemName: "tag")
                    Text("Offers")
                }
            OrderPage()
                .tabItem {
                    Image(systemName: "cart")
                    Text("My Order")
                }
                .badge(cartManager.cart.count)
            InfoPage()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Info")
                }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(MenuManager())
        .environmentObject(CartManager())
        .environmentObject(LikesManager())
}
