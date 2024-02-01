//
//  WishlistView.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 13/01/2024.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading, spacing: 32){
                
                VStack (alignment: .leading, spacing: 4){
                    Text("Log in to view your wishlists")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("You can create, view or edit wishlists once you've logged in ")
                        .font(.footnote)
                    
                    
                }
                
                Button{
                    print("Log in")
                }label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistView()
}
