//
//  Signup.swift
//  login
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct SignUp: View {
    @Binding var showLogin: Bool
    
    @State private var emailId: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var ConfirmPassword: String = ""
    
    @State var emailIdIsValid: Bool = true
    
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
   
    var body: some View {
        Text("Tell us more about yourself")
            .font(.custom("Rubik-Bold", size: 40))
            .padding(.top, 25)
            .multilineTextAlignment(.center)
            .padding(.top, 35)
            .foregroundColor(.white)
        
        VStack(alignment: .leading, spacing: 15, content: {
            
            Text("Please sign up to continue")
                .foregroundColor(.white)
                .font(.custom("Rubik-SemiBold", size: 18))
                .foregroundStyle(.gray)
                .padding(.top, 60)
            
            
            VStack(spacing: 20) {
                /// Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email Id", value: $emailId)
                    .autocapitalization(.none)
                    .foregroundColor(emailIdIsValid ? Color.green : Color.red)
                    .onChange(of: emailId) { newValue in
                        if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                            self.emailIdIsValid = true
                        } else {
                            self.emailIdIsValid = false
                        }
                    }
                
                CustomTF(sfIcon: "person", hint: "Full Name", value: $fullName)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Password",isPassword: true, value: $password)
                    .padding(.top, 5)
                
                CustomTF(sfIcon: "lock", hint: "Confirm Password",isPassword: true, value: $ConfirmPassword)
                    .padding(.top, 5)
                
                if !password.isEmpty && !ConfirmPassword.isEmpty && password != ConfirmPassword {
                    Text("Password Doesnt Match")
                        .foregroundStyle(.red)
                        .font(.callout)
                }
                
                /// SignUp Button
                GradientButton(title: "Continue", icon: "arrow.right") {
                    askOTP.toggle()
                }
                .foregroundColor(.white)
                .hSpacing(.trailing)
                /// Disabling Until the Data is Entered
                .disableWithOpacity(emailId.isEmpty || password.isEmpty || fullName.isEmpty || ConfirmPassword.isEmpty || password != ConfirmPassword || !emailIdIsValid)
            }
            .padding(.top, 20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 6) {
                Text("Already have an Account?")
                    .font(.custom("Rubik-Regular", size: 18))
                    .foregroundColor(.white)
                    .foregroundStyle(.gray)
                
                Button("Login") {
                    showLogin.toggle()
                }
                .fontWeight(.bold)
                .tint(.teal)
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
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
    LoginView()
}
