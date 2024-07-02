//
//  Login_SignUp.swift
//  login
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct Login_SignUp: View {
    /// View Properties
    @State private var showSignup: Bool = false
    var body: some View {
        Spacer()
            .navigationBarBackButtonHidden(true)
        
        NavigationStack {
            Login(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    SignUp(showSignup: $showSignup)
                }
        }
        .overlay {
            CircleView()
                .animation(.smooth(duration: 0.45, extraBounce: 0), value: showSignup)
        }
    }
    /// Moving Blurred background
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [Color(UIColor(red: 7/255, green: 71/255, blue: 37/255, alpha: 1)), Color(UIColor(red: 6/255, green: 60/255, blue: 29/255, alpha: 1)), Color(UIColor(red: 6/255, green: 48/255, blue: 24/255, alpha: 1))], startPoint: .top, endPoint: .bottom))
            .frame(width:200, height: 200)
            .offset(x: showSignup ? 90 : -90, y: -90)
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .VSpacing(.top)
        
    }
}

#Preview {
    Login_SignUp()
}
