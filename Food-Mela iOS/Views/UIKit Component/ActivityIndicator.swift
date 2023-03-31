//
//  CirculerLoadingView.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 16/3/23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .brandPrimary
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingIndicator: View {
    var body: some View{
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            //ActivityIndicator()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}



struct CirculerLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
