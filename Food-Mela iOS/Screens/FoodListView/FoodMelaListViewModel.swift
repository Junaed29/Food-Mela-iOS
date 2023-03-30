//
//  FoodMelaListViewModel.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 15/3/23.
//

import SwiftUI


@MainActor
final class FoodMelaListViewModel: ObservableObject {
    @Published var foodList: [FoodItem] = []
    @Published var alermItem: AlertItem?
    @Published var isLoading = true
    @Published var selectedFoodItem : FoodItem?
    @Published var isShowingDetailsView = false
    
//    func getFoodList() {
//        isLoading = true
//
//        NetworkManager.shared.getRequest(urlString: UrlConstant.GET_FOOD_LIST, respnseType: FoodListResponse.self) { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//
//                switch result {
//                case .success(let success):
//                    self.foodList = success.request
//
//                case .failure(let networkErrors):
//                    switch networkErrors {
//
//                    case .invalidURL:
//                        self.alermItem = AlertContext.invalidURL
//
//                    case .invalidResponse:
//                        self.alermItem = AlertContext.invalidResponse
//
//                    case .invalidDeta:
//                        self.alermItem = AlertContext.invalidData
//
//                    case .unableToComplete:
//                        self.alermItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    
    func getFoodList() {
        isLoading = true

        Task{
            do{
                foodList = try await NetworkManagerAsync.getRequest(urlString: UrlConstant.GET_FOOD_LIST, respnseType: FoodListResponse.self).request
            }catch{
                if let networkError = error as? NetworkErrors {
                    switch networkError {
                    case .invalidURL:
                        alermItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alermItem = AlertContext.invalidResponse
                    case .invalidDeta:
                        alermItem = AlertContext.invalidData
                    case .unableToComplete:
                        alermItem = AlertContext.unableToComplete
                    }
                }else{
                    alermItem = AlertContext.unableToComplete
                }
            }
            
            isLoading = false
        }
        
    }
}
