//
//  ExploreViewModel.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 24/01/2024.
//

import Foundation


class ExploreViewModel: ObservableObject{
    @Published var listings = [Listing]()
    private let service: ExploreService
    
    init(service: ExploreService){
        self.service = service
        
        
        
        Task {
            await fetchListings()
        }
    }
    
    func fetchListings() async {
        do{
            self.listings = try await service.fetchListings()
        }catch{
            print ("Dailed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation(_ location: String){
        let filteredListings = listings.filter({
            $0.city.lowercased() == location.lowercased() ||
            $0.state.lowercased() == location.lowercased()
        })
    }
}
