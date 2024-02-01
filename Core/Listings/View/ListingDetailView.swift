//
//  ListingDetailView.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 08/01/2024.
//

import SwiftUI
import MapKit



struct ListingDetailView: View {
    
   
    
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        
        let region = MKCoordinateRegion(
            center: listing.city == "Los Angeles" ? .losAngeles : .miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        
        ScrollView{
            ZStack (alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                
                HStack{
                    
                    Button{
                        dismiss()
                        
                    } label: {
                        
                        Image(systemName: "chevron.left")
                        
                            .foregroundStyle(.black)
                            .background {
                                Circle()
                                
                                    .fill(Color.white.opacity(0.8))
                                
                                
                                
                                    .frame(width: 32, height: 32)
                                
                            }
                            .padding()
                        
                    }
                    
                    Spacer()
                } .padding(.top, 60)
                    .padding(.leading)

                
            }
            
            //Hotel infro view
            VStack(alignment: .leading, spacing: 8){
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                        
                        Text("-")
                        
                        Text("28 reviews")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .font(.caption)
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .fontWeight(.semibold)
                }
                
                
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            //Host info view
            HStack{
                VStack (alignment: .leading, spacing: 4){
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 2){
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBefrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")

                    }
                    
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                //User pic
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                
            }.padding()
            
            
            Divider()
            
            //Listing features view
            VStack (alignment: .leading, spacing: 16){
                ForEach(listing.features) {feature in
                    
                    
                    HStack (spacing: 12){
                        Image(systemName: feature.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .fontWeight(.semibold)
                                .font(.footnote)
                            Text(feature.subtitle)
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
            
            //Bedrooms View
            VStack (alignment: .leading){
                Text("Where you'll sleep")
                    .font(.headline)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(1 ... listing.numberOfBefrooms, id: \.self) { bedroom in
                            VStack(alignment: .leading){
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            
                            .frame(width: 132, height: 100)
                            .overlay{RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                                
                            }
                            
                            
                        }
                    }
                    
                }.scrollTargetBehavior(.paging)
            }.padding()
            
            Divider()
            
            //Amenities View
            VStack(alignment: .leading, spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                ForEach(listing.amenities){ amenity in
                    HStack(spacing: 12){
                        
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        Text(amenity.title)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            //Map View
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                    .padding(.leading)
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
                
            }.padding()
            
        }.toolbar(.hidden, for: .tabBar)
            .ignoresSafeArea()
            .padding(.bottom, 110)
        
            .overlay(alignment: .bottom) {
                //footer
                
                VStack{
                    Divider()
                        .padding(.bottom)
                    
                    HStack{
                        VStack (alignment: .leading){
                            Text("€\(listing.pricePerNight)")
                                .fontWeight(.semibold)
                                .font(.subheadline)
                            Text("Total before taxes")
                                .font(.footnote)
                            Text("Oct 15-20")
                                .fontWeight(.semibold)
                                .font(.footnote)
                        }
                        //    .padding()
                        Spacer()
                        
                        Button {
                            
                        }label: {
                            Text("Reserve")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 140, height: 40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }.padding()
                }.background(.white)
                
            }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[2])
}
