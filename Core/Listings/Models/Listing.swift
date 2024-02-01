//
//  Listing.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 14/01/2024.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable{
    
    let id: String
    //landlord
    let ownerID: String
    let ownerName: String
    let ownerImageUrl: String
    
    //accomodation
    let numberOfBefrooms: Int
    let numberOfBeds: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    
    //more details
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    
    //photos
    var imageURLs: [String]
    
    //adress
    let city: String
    let address: String
    let state: String
    
    let title: String
    var rating: Double
    
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    
    let type: ListingType
    
}

//MARK: - Listing features data

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    
    case selfCheckIn
    case superHost
    
    var id: Int{ return self.rawValue}
    
    
    var imageName: String{
        switch self{
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    
    var title: String{
        switch self{
        case .selfCheckIn: return "Self check-in"
        case .superHost: return "Superhost"
        }
    }
    
    
    
    var subtitle: String {
        switch self {
        case .selfCheckIn:
            return "Check yourself in with the keypad."
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are commited to providing greate stars for guests."
        }
    }
            
            
 }

//MARK: - Amenities data

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    //Returning the title of the amenity in the listing detailed view
    var title: String {
        switch self{
        case .pool:return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alarm Service"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    //Returning the image (imageName) of the amenity in the listing detailed view

    var imageName: String {
        switch self{
        case .pool:return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "shield.checkered"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
    
    var id: Int{ return self.rawValue}
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villa"
            
        }
    }
    var
id: Int { return self.rawValue }
}
