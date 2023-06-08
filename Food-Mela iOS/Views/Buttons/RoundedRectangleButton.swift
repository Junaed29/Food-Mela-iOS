//
//  RoundedRectangleButton.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 8/6/23.
//

import SwiftUI

struct RoundedRectangleButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
            
        }
        .frame(width: getScreenWide() - 100, height: 40)
        .padding()
    }
}

struct RoundedRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleButton(title:"Log In", background: .blue){
            
        }
    }
}
