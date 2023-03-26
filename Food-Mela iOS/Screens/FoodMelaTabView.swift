//
//  ContentView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 13/3/23.
//

import SwiftUI

struct FoodMelaTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            FoodMelaListView()
                .tabItem {
                    Label("Home", systemImage:  "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage:  "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage:  "bag")
                }
                .badge(order.orderItems.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodMelaTabView()
            .environmentObject(Order())
    }
}
