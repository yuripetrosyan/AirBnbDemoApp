//
//  ListingImageCarouselView.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 08/01/2024.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    
    var body: some View {
        TabView{
            ForEach(images, id: \.self) {image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
           
           .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
