//
//  SearchAndFilterBar.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 2.09.2024.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @StateObject var viewModel: ExploreViewModel
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading) {
                Text(viewModel.searchLocation.isEmpty ? "Where to ?": viewModel.searchLocation)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("\(viewModel.searchLocation.isEmpty ? "Anywhere - " : "")Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(viewModel: ExploreViewModel(service: ExploreService()))
}
