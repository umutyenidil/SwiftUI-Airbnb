//
//  MainTabBar.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 3.09.2024.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            WishlistView()
                .tabItem {
                    Label("Wishlists", systemImage: "heart")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabBar()
}
