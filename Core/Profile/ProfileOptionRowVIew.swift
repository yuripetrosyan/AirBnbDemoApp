//
//  ProfileOptionRowVIew.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 13/01/2024.
//

import SwiftUI


struct ProfileOptionRowVIew: View {
    
    var imageName: String
    var settingText: String
    
    
    var body: some View {
        HStack{
            
            Image(systemName: imageName)
            Text(settingText)
            Spacer()
            Image(systemName: "greaterthan.circle")
            
        }.padding(.horizontal)
            .padding(.top)
    }
}
