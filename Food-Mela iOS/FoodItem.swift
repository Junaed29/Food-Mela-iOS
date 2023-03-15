//
//  FoodItem.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 14/3/23.
//

import Foundation


struct FoodItem: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let protein: Int
    let price: Double
    let calories: Int
    let imageURL: String
    let carbs: Int
   

    enum CodingKeys: String, CodingKey {
        case description = "description"
        case protein = "protein"
        case price = "price"
        case calories = "calories"
        case imageURL = "imageURL"
        case carbs = "carbs"
        case id = "id"
        case name = "name"
    }
}

struct FoodListResponse {
    let request: [FoodItem]

    enum CodingKeys: String, CodingKey {
        case request = "request"
    }
}


struct FoodListResponseMockData {
    static let detaItem = FoodItem(id: 12, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", protein: 14, price: 8.99, calories: 300, imageURL: "", carbs: 3)

    static let detaItemList = [detaItem, detaItem, detaItem, detaItem, detaItem, detaItem, detaItem]
}

