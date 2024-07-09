//
//  Signup.swift
//  login
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct SignUp: View {
    @Binding var showSignup: Bool
    
    @State private var emailId: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var ConfirmPassword: String = ""
    
    @State var emailIdIsValid: Bool = true
    
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
   
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back Button
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("SignUp")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            
            Text("Please sign up to continue")
                .font(.callout)
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email Id", value: $emailId)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .foregroundColor(emailIdIsValid ? Color.green : Color.red)
                    .onChange(of: emailId) { newValue in
                        if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                            self.emailIdIsValid = true
                            print("valid")
                        } else {
                            self.emailIdIsValid = false
                            print("invalid")
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
                .hSpacing(.trailing)
                /// Disabling Until the Data is Entered
                .disableWithOpacity(emailId.isEmpty || password.isEmpty || fullName.isEmpty || ConfirmPassword.isEmpty || password != ConfirmPassword || !emailIdIsValid)
            }
            .padding(.top, 20)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 6) {
                Text("Already have an Account?")
                    .foregroundStyle(.gray)
                
                Button("Login") {
                    showSignup = false
                }
                .fontWeight(.bold)
                .tint(Color(UIColor(red: 7/255, green: 71/255, blue: 37/255, alpha: 1)))
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
