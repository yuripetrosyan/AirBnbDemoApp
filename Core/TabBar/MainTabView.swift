//
//  TabBarView.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 13/01/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
       
        HStack(spacing: 70){
                TabItemView(imageName: "magnifyingglass", text: "Explore")
                
                TabItemView(imageName: "heart.fill", text: "Wishlists")
                
                TabItemView(imageName: "person.crop.circle.fill", text: "Profils")
                
                
            }.padding()
            .background(.white)
           
                
        
        
        
    }
}

#Preview {
    TabBarView()
}


struct TabItemView: View{
    let imageName: String
    let text: String
    
    var body: some View{
        VStack{
            Image(systemName: imageName)
                .resizable()
                .frame(width: 26, height: 26)
                
            Text(text)
                .font(.footnote)
        }.foregroundStyle(.gray)
    }
}
