//
//  FoodDetailView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 17/3/23.
//

import SwiftUI
import AlertToast

struct FoodDetailView: View {
    
    let foodItem : FoodItem
    @Binding var isShowingDetailsView: Bool
    @EnvironmentObject var order: Order
    @Binding var showToast: Bool
    
    var body: some View {
        
        
        VStack{
            FoodListRemoteImage(urlString: foodItem.imageURL, placeHolderImageName: "food_placeholder")
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 225)
            //            AsyncImage(url: URL(string: foodItem.imageURL)) { image in
            //                image.resizable()
            //            } placeholder: {
            //                Image("food_placeholder").resizable()
            //            }
            //            .aspectRatio(contentMode: .fill)
            //            .frame(maxWidth: .infinity, maxHeight: 225)
            
            VStack{
                Text(foodItem.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(foodItem.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack (spacing: 40) {
                    NutrationInfoView(nutrationType: "Calories", nutrationValue: foodItem.calories)
                    NutrationInfoView(nutrationType: "Carbs", nutrationValue: foodItem.carbs)
                    NutrationInfoView(nutrationType: "Protein", nutrationValue: foodItem.protein)
                }
            }
            
            Spacer()
            
            //            Button {
            //                order.addItem(foodItem)
            //                isShowingDetailsView = false
            //            } label: {
            //                FoodButtonView(title: "$\(foodItem.price, specifier: "%.2f") - Add To Order")
            //            }
            //            .padding(.bottom, 30)
            
            Button("$\(foodItem.price, specifier: "%.2f") - Add To Order") {
                order.addItem(foodItem)
                isShowingDetailsView = false
                showToast = true
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
            
        }
        .frame(width: 300 , height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetailsView = false
            } label: {
                XDismissButton()
            }
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(foodItem: FoodListResponseMockData.detaItem, isShowingDetailsView: .constant(false), showToast: .constant(false))
    }
}



struct NutrationInfoView: View {
    let nutrationType: String
    let nutrationValue: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(nutrationType)
                .bold()
                .font(.caption)
            
            Text("\(nutrationValue)")
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .italic()
        }
    }
}
