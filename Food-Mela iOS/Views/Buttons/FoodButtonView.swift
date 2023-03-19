//
//  FoodOrderButtonView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 19/3/23.
//

import SwiftUI

struct FoodButtonView: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 260, height: 50)
            .background(Color(.brandPrimary))
            .cornerRadius(10)
    }
}

struct FoodOrderButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FoodButtonView(title: "dsdsds")
    }
}
