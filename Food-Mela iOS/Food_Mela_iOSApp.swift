//
//  Food_Mela_iOSApp.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 13/3/23.
//

import SwiftUI

@main
struct Food_Mela_iOSApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            FoodMelaTabView().environmentObject(order)
        }
    }
}
