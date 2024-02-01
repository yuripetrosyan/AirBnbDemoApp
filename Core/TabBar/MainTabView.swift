//
//  TabBarView.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 13/01/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
    
        TabView {
            
            ExploreView()
                .tabItem {TabItemView(imageName: "magnifyingglass", text: "Explore") }
            
            
            WishlistView()
                .tabItem { TabItemView(imageName: "heart.fill", text: "Wishlists") }
            
            ProfileVIew()
                .tabItem { TabItemView(imageName: "person.crop.circle.fill", text: "Profils") }
        }
        

        
        
        
    }
}

#Preview {
    MainTabView()
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
