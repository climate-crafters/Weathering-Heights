//
//  Login_SignUp.swift
//  login
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct LoginView: View {
    /// View Properties
    @State private var showLogin: Bool = false
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                        .navigationBarBackButtonHidden(true)
                    SignUp(showLogin: $showLogin)
                        .navigationDestination(isPresented: $showLogin) {
                            Login(showLogin: $showLogin)
                        }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
