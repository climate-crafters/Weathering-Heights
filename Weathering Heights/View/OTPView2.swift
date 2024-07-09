//
//  OTPView.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 05/07/2024.
//

import SwiftUI

struct OTPView2: View {
    @Binding var otpText: String
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showResetView: Bool = false
   
    var body: some View {
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
                GradientButton(title: "Verify OTP", icon: "arrow.right") {
                    ///Code after link sent
                    showResetView.toggle()
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
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *) {
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView()
                    .presentationDetents([.height(350)])
            }
        })
    }
}

#Preview {
    LoginView()
}
