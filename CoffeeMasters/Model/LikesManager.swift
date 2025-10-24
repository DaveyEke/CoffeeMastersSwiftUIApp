//
//  LikesManager.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/23/25.
//

import Foundation
import Combine


class LikesManager: ObservableObject, Observable {
    static let key = "likes"
        @Published var likes: [Int] = []
    init() {
            likes = UserDefaults.standard.array(forKey: LikesManager.key) as? [Int] ?? []
        }
    
    
    func isLiked(id: Int) -> Bool {
        return likes.contains(id)
    }
    
    func toggle(_ id: Int) {
        if isLiked(id: id){
            likes.removeAll { $0 == id } // $0 references the elements
        } else {
            likes.append(id)
        }
        UserDefaults.standard.set(likes, forKey: LikesManager.key)
    }
}
