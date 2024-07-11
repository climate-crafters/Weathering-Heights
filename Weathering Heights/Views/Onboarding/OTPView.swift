//
//  OTPView.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 05/07/2024.
//

import SwiftUI

struct OTPView: View {
    @Binding var otpText: String
    
    @Environment(\.dismiss) private var dismiss
   
    var body: some View {
        ZStack {
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15, content: {
                /// Back Button
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundStyle(.gray)
                })
                .padding(.top, 10)
                
                Text("Enter Otp")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top, 5)
                
                Text("A 6 digit code has been sent to your Email ID.")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                    .padding(.top, -5)
                
                VStack(spacing: 25) {
                    /// Custom OTP TextField
                    OTPVerificationView(otpText: $otpText)
                    /// SignUp Button
                    GradientButton2(title: "Verify OTP", icon: "arrow.right") {
                        ///Code after link sent
                    }
                    .hSpacing(.trailing)
                    /// Disabling Until the Data is Entered
                    .disableWithOpacity(otpText.isEmpty)
                }
                .padding(.top, 20)
            })
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            
            .interactiveDismissDisabled()
        }
    }
}

#Preview {
    LoginView()
}
