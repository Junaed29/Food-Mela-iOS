//
//  FoodMelaListView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 13/3/23.
//

import SwiftUI
import AlertToast

struct FoodMelaListView: View {
    @StateObject var viewModel = FoodMelaListViewModel()
    @State var showToast = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.foodList) { foodItem in
                    FoodListCell(foodItem: foodItem)
                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedFoodItem = foodItem
                            viewModel.isShowingDetailsView = true
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Food-Mela")
                .disabled(viewModel.isShowingDetailsView)
            }
            .blur(radius: viewModel.isShowingDetailsView ? 20 : 0)
            .task {
                viewModel.getFoodList()
            }
            
            if viewModel.isShowingDetailsView{
                FoodDetailView(foodItem: viewModel.selectedFoodItem!, isShowingDetailsView: $viewModel.isShowingDetailsView, showToast: $showToast)
            }
            
            if viewModel.isLoading{
                LoadingIndicator()
            }
        }
        .alert(item: $viewModel.alermItem) { alertitem in
            Alert(title: alertitem.title, message: alertitem.message, dismissButton: alertitem.dismissButton)
        }
        .toast(isPresenting: $showToast){
            AlertToast(displayMode: .banner(.pop), type: .regular, title: "\(viewModel.selectedFoodItem?.name ?? "No Item") added to Order List")
        }
    }
}

struct FoodMelaListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodMelaListView()
    }
}
