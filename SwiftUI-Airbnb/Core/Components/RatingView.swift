//
//  RatingTextView.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 2.09.2024.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            
            Text("\(rating)")
        }
        .foregroundStyle(.black)
        .font(.footnote)
    }
}

#Preview {
    RatingView(rating: 1.0)
}
