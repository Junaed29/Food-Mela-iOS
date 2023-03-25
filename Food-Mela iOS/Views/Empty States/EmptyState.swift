//
//  EmptyState.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 25/3/23.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let title: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground).ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -35)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "invoice", title: "This is a teast message for testing the empty state view")
    }
}
