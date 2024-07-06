//
//  PasswordResetView.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 05/07/2024.
//

import SwiftUI

struct PasswordResetView: View {
    
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State var emailIdIsValid: Bool = true
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
   
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back Button
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            VStack(spacing: 25) {
                /// Custom Text Fields
                CustomTF(sfIcon: "lock", hint: "Password",isPassword: true, value: $password)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                CustomTF(sfIcon: "lock", hint: "Confirm Password",isPassword: true, value: $confirmPassword)
                    .padding(.top, 5)
                
                if !password.isEmpty && !confirmPassword.isEmpty && password != confirmPassword {
                    Text("Password Doesnt Match")
                        .foregroundStyle(.red)
                        .font(.callout)
                }
                
                /// SignUp Button
                GradientButton(title: "Send OTP", icon: "arrow.right") {
                    ///Code after link sent
                    /// Reset Password
                    askOTP.toggle()
                }
                .hSpacing(.trailing)
                /// Disabling Until the Data is Entered
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty || password != confirmPassword)
                
            }
            .padding(.top, 20)
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        
        .interactiveDismissDisabled()
        .sheet(isPresented: $askOTP, content: {
            if #available(iOS 16.4, *) {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
            }
        })
    }
}

#Preview {
    Login_SignUp()
}
