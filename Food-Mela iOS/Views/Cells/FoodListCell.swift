//
//  FoodListCell.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 15/3/23.
//

import SwiftUI

struct FoodListCell: View {
    let foodItem: FoodItem
    
    var body: some View {
        HStack() {
            FoodListRemoteImage(urlString: foodItem.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(foodItem.name)
                    .font(.title2)
                    .fontWeight(.medium)
                //.scaledToFit()
                //.minimumScaleFactor(0.6)
                
                
                Text("$\(foodItem.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct FoodListCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodListCell(foodItem: FoodListResponseMockData.detaItem)
    }
}
