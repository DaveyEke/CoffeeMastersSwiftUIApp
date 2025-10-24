//
//  MenuManager.swift
//  CoffeeMasters
//
//  Created by Dave Mkpa Eke on 10/20/25.
//

import Foundation
import Combine
import Alamofire




class MenuManager: ObservableObject {
    @Published var menu: [Category] = []
    
    init() {
        refreshItemsFromNetwork()
    }
    
    func refreshItemsFromNetwork()  {
        AF.request("https://firtman.github.io/coffeemasters/api/menu.json")
                .responseData { response in
                    if let data = response.value {
                        let decoder = JSONDecoder()
                        if let menuFromNetwork = try? decoder.decode([Category].self, from: data) {
                            print(menuFromNetwork)
                            Task { @MainActor in
                                self.menu = menuFromNetwork
                            }
                        }
                    }
                }
        }
    
}
