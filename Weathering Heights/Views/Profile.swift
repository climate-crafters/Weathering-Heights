//
//  About Us.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 08/07/2024.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea(.all)
                .frame(height: 350)
                .cornerRadius(35)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, -60)
            Circle()
                .fill(.gray)
                .frame(width:150, height:150)
                .padding(.top, -330)
            
            
                
                
        }
    }
}

#Preview {
    Profile()
}
