//
//  FoodMelaListViewModel.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 15/3/23.
//

import SwiftUI


final class FoodMelaListViewModel: ObservableObject {
    @Published var foodList: [FoodItem] = []
    
    func getFoodList() {
        NetworkManager.getRequest(urlString: UrlConstant.GET_FOOD_LIST, respnseType: FoodListResponse.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.foodList = success.request
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
