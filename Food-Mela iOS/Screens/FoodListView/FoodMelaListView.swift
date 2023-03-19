//
//  FoodMelaListView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 13/3/23.
//

import SwiftUI

struct FoodMelaListView: View {
    @StateObject var viewModel = FoodMelaListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.foodList) { foodItem in
                    FoodListCell(foodItem: foodItem).onTapGesture {
                        viewModel.selectedFoodItem = foodItem
                        viewModel.isShowingDetailsView = true
                    }
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Food-Mela")
                .disabled(viewModel.isShowingDetailsView)
            }
            .blur(radius: viewModel.isShowingDetailsView ? 20 : 0)
            .onAppear {
                viewModel.getFoodList()
            }
            
            if viewModel.isShowingDetailsView{
                FoodDetailView(foodItem: viewModel.selectedFoodItem!, isShowingDetailsView: $viewModel.isShowingDetailsView)
            }
            
            if viewModel.isLoading{
                LoadingIndicator()
            }
        }
        .alert(item: $viewModel.alermItem) { alertitem in
            Alert(title: alertitem.title, message: alertitem.message, dismissButton: alertitem.dismissButton)
        }
    }
}

struct FoodMelaListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodMelaListView()
    }
}
