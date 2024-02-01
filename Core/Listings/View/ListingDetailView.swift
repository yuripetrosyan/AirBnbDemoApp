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
    
    var body: some View {
        
        ScrollView{
            ZStack (alignment: .topLeading) {
                ListingImageCarouselView()
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
                
                //                    Button{
                //                        dismiss()
                //
                //                    } label: {
                //
                //                        Image(systemName: "chevron.left").padding(.top, 40)
                //
                //                            .foregroundStyle(.black)
                //                            .background {
                //                                Circle()
                //                                    .fill(.white.opacity(0.9))
                //                                    .frame(width: 32, height: 32)
                //                                    .padding(.top, 40)
                //                                }
                //                            .padding()
                //
                //                    }
                
                
                
            }
            
            //Hotel infro view
            VStack(alignment: .leading, spacing: 8){
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text("4.86")
                        
                        Text("-")
                        
                        Text("28 reviews")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .font(.caption)
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
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
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                        .fontWeight(.semibold)
                    
                    
                    Text("4 guests - 4 bedrooms - 4 beds - 3 baths")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                //User pic
                Image("profilepic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                
            }.padding()
            
            
            Divider()
            
            //Listing features view
            VStack (alignment: .leading, spacing: 16){
                ForEach(0 ..< 2) {feature in
                    
                    
                    HStack (spacing: 12){
                        Image(systemName: "medal")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .fontWeight(.semibold)
                                .font(.footnote)
                            Text("Superhost are experienced, highly rated hosts, who are committed to providing great stars for guests.")
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
                        ForEach(1...4, id: \.self) { bedroom in
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
                ForEach(1..<5){ feature in
                    HStack(spacing: 12){
                        
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                        
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
                Map()
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
                            Text("$400")
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
    ListingDetailView()
}
