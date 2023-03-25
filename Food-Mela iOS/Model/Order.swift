//
//  Order.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 24/3/23.
//

import SwiftUI

final class Order: ObservableObject{
    @Published var orderItems: [FoodItem] = []
    
    var totalPrice: Double{
        orderItems.reduce(0) { $0 + $1.price }
    }
    
    func addItem(_ foodItem: FoodItem) -> Void {
        orderItems.append(foodItem)
    }
    
    func deleteOrderedItem(indexSet: IndexSet){
        orderItems.remove(atOffsets: indexSet)
    }
}
 
