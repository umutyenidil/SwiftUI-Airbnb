//
//  UrlImageView.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 3.09.2024.
//

import SwiftUI

struct UrlImageView: View {
    private var imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Show a loading indicator
                            
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                           
                    case .failure:
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.red)
                    @unknown default:
                        Image(systemName: "questionmark")
                            .resizable()
                            .scaledToFit()
                            
                    }
                }
    }
}

#Preview {
    UrlImageView(imageUrl: "https://picsum.photos/512")
}
