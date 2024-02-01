//
//  ProfileVIew.swift
//  AirBnb
//
//  Created by Yuri Petrosyan on 13/01/2024.
//

import SwiftUI

struct ProfileVIew: View {
    var body: some View {
        
        VStack {
            //profile login view
            VStack (alignment: .leading, spacing: 32){
                
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    
                    Text("Log in to start planning your next trip")
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
                
                
                
                
                HStack{
                    Text("Don't have an account?")
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Sign up").underline()
                    })
                    
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    
                    
                }.font(.caption)
                
            }
            
            VStack(spacing: 5){
                ProfileOptionRowVIew(imageName: "gear", settingText: "Settings")
                Divider()
                ProfileOptionRowVIew(imageName: "accessibility", settingText: "Accessibility")
                Divider()
                ProfileOptionRowVIew(imageName: "questionmark.circle", settingText: "Visit the Help Center")
                Divider()
                
                
                
                
                
                
                
                
                
            }
        }
    }
}

#Preview {
    ProfileVIew()
}

