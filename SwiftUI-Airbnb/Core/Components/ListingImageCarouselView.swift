//
//  ListingImageCarouselView.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 2.09.2024.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let imageURLs: [String]
    var body: some View {
        TabView {
            ForEach(imageURLs, id: \.self) { image in
                UrlImageView(imageUrl: image)
                    .scaledToFill()
            }
        }
        .frame(height: 320)
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(imageURLs: ["https://picsum.photos/300"])
}
