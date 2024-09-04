//
//  ExploreService.swift
//  SwiftUI-Airbnb
//
//  Created by Umut Yenidil on 3.09.2024.
//

import Foundation

class ExploreService {
    func fetchListings () async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
