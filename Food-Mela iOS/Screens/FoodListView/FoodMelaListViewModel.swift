//
//  FoodMelaListViewModel.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 15/3/23.
//

import SwiftUI


final class FoodMelaListViewModel: ObservableObject {
    @Published var foodList: [FoodItem] = []
    @Published var alermItem: AlertItem?
    @Published var isLoading = true
    
    func getFoodList() {
        isLoading = true
        
        NetworkManager.shared.getRequest(urlString: UrlConstant.GET_FOOD_LIST, respnseType: FoodListResponse.self) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let success):
                    self.foodList = success.request
                    
                case .failure(let networkErrors):
                    switch networkErrors {
                        
                    case .invalidURL:
                        self.alermItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alermItem = AlertContext.invalidResponse
                        
                    case .invalidDeta:
                        self.alermItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alermItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
