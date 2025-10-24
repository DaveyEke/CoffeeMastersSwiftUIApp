//
//  LikeButtonView.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/23/25.
//

import SwiftUI

struct LikeButton: View {
    @EnvironmentObject var likesManager: LikesManager
    
    var product: Product
    
    var body: some View {
        Image(systemName:  likesManager.isLiked(id: product.id) ? "heart.fill" : "heart")
            .padding()
            .foregroundColor(.red)
            .accessibilityLabel(likesManager.isLiked(id: product.id) ? "Dislike" : "Like")
            .onTapGesture {
                likesManager.toggle(product.id)
            }
    }
}

#Preview {
    LikeButton(product: DummyProduct)
        .environment(LikesManager())
}
