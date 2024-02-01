//
//  ExploreService.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 24/01/2024.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        
        
        return DeveloperPreview().listings
        
    }
}
