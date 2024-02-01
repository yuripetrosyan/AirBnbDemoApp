//
//  DeveloperPreview.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 16/01/2024.
//

import Foundation

class DeveloperPreview{
    
    static let shared = DeveloperPreview()
    
    //mock data
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerID: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBefrooms: 4,
            numberOfBeds: 3,
            numberOfBathrooms: 4,
            numberOfGuests: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            imageURLs: [
                "listing-1",
                "listing-2",
                "listing-3",
                "listing-4"
            ],
            city: "124 Main St",
            address: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerID: NSUUID().uuidString,
            ownerName: "Yuri Petrosyan",
            ownerImageUrl: "profilepic",
            numberOfBefrooms: 1,
            numberOfBeds: 2,
            numberOfBathrooms: 1,
            numberOfGuests: 2,
            pricePerNight: 350,
            latitude: 20.7850,
            longitude: -30.1936,
            imageURLs: [
                "listing-3",
                "listing-1",
                "listing-2",
                "listing-4"
            ],
            city: "Amsterdam",
            address: "170 Dennenrodepad",
            state: "Noord Holland",
            title: "Amsterdam Studio",
            rating: 3.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .kitchen, .office],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerID: NSUUID().uuidString,
            ownerName: "Evan Jordan",
            ownerImageUrl: "profilepic",
            numberOfBefrooms: 4,
            numberOfBeds: 3,
            numberOfBathrooms: 8,
            numberOfGuests: 3,
            pricePerNight: 789,
            latitude: 50.7850,
            longitude: -80.1936,
            imageURLs: [
                "listing-4",
                "listing-3",
                "listing-1",
                "listing-2"
                
                
            ],
            city: "New York",
            address: "5th Street",
            state: "Manhattan",
            title: "New York TownHouse",
            rating: 4.95,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .pool, .alarmSystem, .office],
            type: .townHouse
        )
        
        
    ]
    
}
