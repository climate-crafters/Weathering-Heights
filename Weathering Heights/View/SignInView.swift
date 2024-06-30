//
//  SignInView.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 30/06/2024.
//

import SwiftUI

struct SignInView: View {
    
    @State private var emailID: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Password",isPassword: true, value: $password)
                    .padding(.top, 5)
                
                Button("Forgot Password?") {
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(Color(UIColor(red: 254/255, green: 206/255, blue: 57/255, alpha: 1)))
                .hSpacing(.trailing)
            }
            .padding(.top, 20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        })
        .padding(.vertical,15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    SignInView()
}
