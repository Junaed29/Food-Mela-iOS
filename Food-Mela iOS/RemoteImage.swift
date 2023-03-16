//
//  RemoteImage.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 16/3/23.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    
    @Published var image: Image? = nil
    
    
    func load(fromURLSting urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else{ return}
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    var image: Image?
    
    var body: some View{
        image?.resizable() ?? Image("food_placeholder").resizable()
    }
}


struct FoodListRemoteImage: View {
    var urlString: String
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View{
        RemoteImage(image: imageLoader.image).onAppear {
            imageLoader.load(fromURLSting: urlString)
        }
    }
}
