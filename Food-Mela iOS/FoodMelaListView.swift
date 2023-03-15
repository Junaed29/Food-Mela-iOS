//
//  FoodMelaListView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 13/3/23.
//

import SwiftUI

struct FoodMelaListView: View {
    var body: some View {
        NavigationView {
            List(FoodListResponseMockData.detaItemList) { foodItem in
                FoodListCell(foodItem: foodItem)
            }
            .listStyle(.plain)
           .navigationTitle("🍟 Food-Mela")
        }
    }
}

struct FoodMelaListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodMelaListView()
    }
}
