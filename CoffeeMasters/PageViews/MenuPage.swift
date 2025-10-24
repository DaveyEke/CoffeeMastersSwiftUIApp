//
//  MenuPage.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/18/25.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager:MenuManager
    @State var search: String = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(menuManager.menu) { category in
                    Text(category.name)
                    
                    ForEach(category.filteredItems(text: search)) { item in
                        NavigationLink(destination: DetailsPage(product: item)) {
                            ProductItem(product: item)
                                .padding(.top)
                                .padding(.leading)
                                .padding(.bottom, 12)
                        }
                    }
                }
            }
            .searchable(text: $search)
            .navigationTitle("Products")
        }
    }
}

#Preview {
  MenuPage()
    .environmentObject(MenuManager())
    .environmentObject(CartManager())
    .environmentObject(LikesManager())
}
