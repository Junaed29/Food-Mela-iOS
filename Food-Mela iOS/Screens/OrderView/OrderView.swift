//
//  OrderView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 13/3/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack{
                    List {
                        ForEach(order.orderItems) { foodItem in
                            FoodListCell(foodItem: foodItem)
                        }.onDelete (perform: order.deleteOrderedItem)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        FoodButtonView(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                }
                if order.orderItems.isEmpty{
                    EmptyState(imageName: "invoice", title: "You have no items in your order. \nPlease add Food items!")
                }
            }.navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
